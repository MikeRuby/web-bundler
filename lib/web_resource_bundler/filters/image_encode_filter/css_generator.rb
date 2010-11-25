module WebResourceBundler
  module Filters
    module ImageEncodeFilter
      class CssGenerator
        TAGS = ['background-image', 'background']
        SEPARATOR = 'A_SEPARATOR'
        PATTERN = /((#{TAGS.join('|')})\s*:[^\(]*)url\(\s*['|"]([^\)]*)['|"]\s*\)/
        FILE_PREFIX = 'base64_'
        IE_FILE_PREFIX = 'base64_ie_'

        def initialize(settings, file_manager)
          @settings = settings
          @file_manager = file_manager 
        end

        def set_settings(settings)
          @settings.set(settings)
        end

        #construct mhtml head of css file with definition of image data in base64
        def construct_header_for_ie(images)
          result = ""
          unless images.empty?
            result += "/*" + "\n"
            result += 'Content-Type: multipart/related; boundary="' + SEPARATOR + '"' + "\n\n"
            #each image found in css should be defined in header with base64 encoded content
            images.each_key do |key|
              result += images[key].construct_mhtml_image_data('--' + SEPARATOR)
            end
            result += "\n" + '--' + SEPARATOR + '--' + "\n"
            result += "*/" + "\n"
          end
          result
        end

        #creates mhtml link to use in css tags instead of image url
        def construct_mhtml_link(filename)
          "#{@settings.protocol}://#{File.join(@settings.domain, @settings.cache_dir, filename)}"
        end

        #name of a new file with images encoded
        def encoded_filename(base_file_path)
          FILE_PREFIX + File.basename(base_file_path)
        end

        #name of a new file for IE with images encoded
        def encoded_filename_for_ie(base_file_path)
          IE_FILE_PREFIX + File.basename(base_file_path)
        end
        
        #iterates through all tags found in css
        #if image exist and has proper size - it should be encoded
        #each tag with this kind of an image is replaced with new one (mhtml link for IE and base64 code for another browser
        #returns images hash - in case generator can build proper IE css header with base64 images encoded
        def encode_images_basic!(content)
          images = {}
          new_content = content.gsub!(PATTERN) do |s|
            tag, url = $1, $3
            data = ImageData.new(url, @settings.resource_dir) 
            if data.exist and data.size <= @settings.max_image_size and block_given?
              #using image url as key to prevent one image be encoded many times
              images[data.url] = data unless images[data.path]
              #changing string using provided block
              s = yield(data, tag) if block_given?
            else
              #returning the same string because user failed with image path - such image non existent
              s
            end
          end
          images
        end

        #generates css file for IE with encoded images using mhtml in cache dir
        def encode_images_for_ie!(file)
          file.name = encoded_filename_for_ie(file.name)
          #creating new css content with images encoded in base64
          images = encode_images_basic!(file.content) do |image_data, tag|
            "*#{tag}url(mhtml:#{construct_mhtml_link(file.name)}!#{image_data.id})"
          end
          file.content = construct_header_for_ie(images) + file.content 
          file
        end
    
        #generates css file with encoded images in cache dir 
        def encode_images!(file)
          file.name = encoded_filename(file.name)
          #creating new css content with images encoded in base64
          encode_images_basic!(file.content) do |image_data, tag|
              "#{tag}url('data:image/#{image_data.extension};base64,#{image_data.encoded}')"
          end
          file
        end

      end
    end
  end
end
