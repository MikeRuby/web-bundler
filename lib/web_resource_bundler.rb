$:.unshift File.join(File.dirname(__FILE__), 'web_resource_bundler')
require 'content_management/block_parser'
require 'content_management/block_data'
require 'content_management/css_url_rewriter'
require 'content_management/resource_file'

require 'file_manager'
require 'settings_manager'
require 'logger'
require 'filters'
require 'exceptions'
require 'rails_app_helpers'
require 'yaml'
require 'digest/md5'

module WebResourceBundler
  class Bundler
    class << self

      attr_reader :settings, :settings_correct, :filters, :logger

      def init
        @filters = {} 
        @settings = nil
        @file_manager = FileManager.new('','') 
        @parser = BlockParser.new
        @logger = nil 
        @settings_correct = false
      end

      #this method should called in initializer
      def setup(rails_root, rails_env)
        @settings = SettingsManager.create_settings(rails_root, rails_env)
        @settings_correct = SettingsManager.settings_correct?(@settings)
        if @settings_correct
          @logger = create_logger(@settings[:log_path]) unless @logger
          @file_manager.resource_dir, @file_manager.cache_dir = @settings[:resource_dir], @settings[:cache_dir]
          set_filters(@settings, @file_manager) 
        end
      end

      #this method should be used to turn on\off filters
      #on particular request
      def set_settings(settings)
        @settings.merge!(settings)
        @settings_correct = SettingsManager.settings_correct?(@settings)
        set_filters(@settings, @file_manager)
      end

      #main method to process html text block
      def process(block, domain, protocol)
        if @settings_correct
          begin
            filters = filters_array
            #passing current request domain and protocol to each filter
            filters.each do |filter|
              SettingsManager.set_request_specific_settings!(filter.settings, domain, protocol)
            end
            #parsing html text block, creating BlockData instance
            block_data = @parser.parse(block)
            #if filters set and no bundle files exists we should process block data
            unless filters.empty? or bundle_upto_date?(block_data)
              #reading files content and populating block_data
              read_resources!(block_data)
              #applying filters to block_data
              block_data.apply_filters(filters)
              #writing resulted files with filtered content on disk
              write_files_on_disk(block_data)
              @logger.info("files written on disk")
              return block_data
            end
            #bundle up to date, returning existing block with modified file names 
            block_data.apply_filters(filters)
            return block_data
          rescue Exceptions::WebResourceBundlerError => e
            @logger.error(e.to_s)
            return nil
          rescue Exception => e
            @logger.error(e.backtrace.join("\n") + "Unknown error occured: " + e.to_s)
            return nil
          end
        end
      end

      private

      #giving filters array in right sequence (bundle filter should be first)
      def filters_array
        filters = []
        %w{bundle_filter base64_filter cdn_filter}.each do |key|
          filters << @filters[key.to_sym] if @settings[key.to_sym][:use] and @filters[key.to_sym] 
        end
        filters
      end

      #creates filters or change their settings
      def set_filters(settings, file_manager)
        filters_data = {
          :bundle_filter => 'BundleFilter',
          :base64_filter => 'ImageEncodeFilter',
          :cdn_filter => 'CdnFilter'
        }
        filters_data.each_pair do |key, filter_class| 
          #if filter settings are present and filter turned on
          if settings[key] and settings[key][:use] 
            filter_settings = SettingsManager.send("#{key}_settings", settings) 
            if @filters[key] 
              @filters[key].set_settings(filter_settings)
            else
              #creating filter instance with settings
              @filters[key] = eval("Filters::" + filter_class + "::Filter").new(filter_settings, file_manager)
            end
          end
        end
        @filters
      end

      def create_logger(log_path)
        begin
          log_dir = File.dirname(log_path)
          #we should create log dir in rails root if it doesn't exist
          Dir.mkdir(log_dir) unless File.exist?(log_dir)
          file = File.open(log_path, File::WRONLY | File::APPEND | File::CREAT)
          logger = Logger.new(file)
        rescue Exception => e
          raise WebResourceBundler::Exceptions::LogCreationError.new(log_path, e.to_s) 
        end
        logger
      end

      #checks if resulted files exist for current @filters and block data
      def bundle_upto_date?(block_data)
        #we don't want to change original parsed block data
        #so just making a clone, using overriden clone method in BlockData
        block_data_copy = block_data.clone
        #modifying clone to obtain resulted files
        #apply_filters will just compute resulted file paths
        #because block_data isn't populated with files content yet
        block_data_copy.apply_filters(filters_array)
        #cheking if resulted files exist on disk in cache folder
        block_data_copy.all_files.each do |file|
          return false unless File.exist?(File.join(@settings[:resource_dir], file.path))
        end
        true
      end

      #reads block data resource files content from disk and populating block_data
      def read_resources!(block_data)
        #iterating through each resource files
        block_data.files.each do |file|
          content = @file_manager.get_content(file.path)
          #rewriting url to absolute if content is css
          WebResourceBundler::CssUrlRewriter.rewrite_content_urls!(file.path, content) if file.types.first[:ext] == 'css'  
          file.content = content
        end
        #making the same for each child blocks, recursively
        block_data.child_blocks.each do |block|
          read_resources!(block)
        end
      end

      #recursive method to write all resulted files on disk
      def write_files_on_disk(block_data)
        @file_manager.create_cache_dir
        block_data.files.each do |file|
          File.open(File.join(@settings[:resource_dir], file.path), "w") do |f|
            f.print(file.content)
          end
        end
        block_data.child_blocks.each do |block|
          write_files_on_disk(block)
        end
      end

    end
  end
end
