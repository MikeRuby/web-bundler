require 'yaml'
class WebResourceBundler::Settings

  DEFAULT_LOG_PATH      = 'log/web_resource_bundler.log'
  DEFAULT_RESOURCE_DIR  = 'public'
  DEFAULT_SETTINGS_PATH = 'config/web_resource_bundler.yml'
  DEFAULT_CACHE_DIR     = 'cache'

  class << self

    attr_accessor :settings

    #creates settings from config file
    #and merging them with defaults
    def create_settings(rails_root, rails_env)
      @settings = {}
      if File.exist?(rails_root)
        @settings = self.read_from_file(rails_root, rails_env) 
        @settings = self.defaults(rails_root).merge(@settings)
      end
      @settings
    end

    #ensures that settings has obligatory keys present
    def correct?
      %w{resource_dir log_path cache_dir}.each do |key|
        return false unless @settings.has_key?(key.to_sym)
      end
      return true
    end

    #dynamically created methods for each filter have its own settings method
    %w{base64_filter cdn_filter bundle_filter}.each do |filter_name|
      define_method "#{filter_name}_settings" do
        self.commons(@settings).merge(@settings[filter_name.to_sym])
      end
    end 

    #setting request specific settings like domain and protocol
    def set_request_specific_data!(settings, domain, protocol)
      settings[:domain]    = domain
      settings[:protocol]  = protocol
      settings
    end

    def set(settings)
      @settings.merge!(settings)
    end

    protected

    #load settings from yaml file depending on environment
    #if no settings found - returning empty hash
    def read_from_file(rails_root, rails_env)
      settings = {} 
      file_path = self.settings_file_path(rails_root) 
      if File.exist?(file_path)
        all_settings = YAML::load(File.open(file_path))
        if all_settings[rails_env]
          settings = all_settings[rails_env]
          settings[:resource_dir] = File.join(rails_root, DEFAULT_RESOURCE_DIR)
        end
      end
      settings
    end

    def settings_file_path(rails_root)
      File.join(rails_root, DEFAULT_SETTINGS_PATH)
    end

    #creates defaults settings
    def defaults(rails_root)
      {
        :resource_dir  => File.join(rails_root, DEFAULT_RESOURCE_DIR),
        :log_path      => File.join(rails_root, DEFAULT_LOG_PATH),
        :cache_dir     => DEFAULT_CACHE_DIR,
        :bundle_filter => {
                            :use => true
                          },
        :cdn_filter    => {
                            :use => false
                          },
        :base64_filter => {
                            :use            => true,
                            :max_image_size => 20
                          }
      }
    end

    #settings common for all filters
    def commons(settings)
      {
        :resource_dir => settings[:resource_dir],
        :cache_dir    => settings[:cache_dir],
      }
    end

  end
end
