require 'filters/base_filter'
require 'filters/image_encode_filter'
require 'filters/bundle_filter'
require 'filters/cdn_filter'
require 'filters/compress_filter'

module WebResourceBundler
  module Filters
    FILTER_NAMES = {
			:bundle_filter   => BundleFilter,
			:base64_filter   => ImageEncodeFilter,
			:cdn_filter      => CdnFilter,
			:compress_filter => CompressFilter 
		}
  end
end
