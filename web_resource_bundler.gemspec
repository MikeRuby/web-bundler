# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{web_resource_bundler}
  s.version = "0.0.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["gregolsen"]
  s.date = %q{2010-12-01}
  s.description = %q{this lib could bundle you css/js files in single file, encode images in base64, rewrite images urls to your cdn hosts}
  s.email = %q{anotheroneman@yahoo.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    ".bundle/config",
     ".gitignore",
     "Gemfile",
     "Gemfile.lock",
     "README",
     "Rakefile",
     "VERSION",
     "lib/web_resource_bundler.rb",
     "lib/web_resource_bundler/content_management/block_data.rb",
     "lib/web_resource_bundler/content_management/block_parser.rb",
     "lib/web_resource_bundler/content_management/css_url_rewriter.rb",
     "lib/web_resource_bundler/content_management/resource_file.rb",
     "lib/web_resource_bundler/exceptions.rb",
     "lib/web_resource_bundler/file_manager.rb",
     "lib/web_resource_bundler/filters.rb",
     "lib/web_resource_bundler/filters/base_filter.rb",
     "lib/web_resource_bundler/filters/bundle_filter.rb",
     "lib/web_resource_bundler/filters/bundle_filter/resource_packager.rb",
     "lib/web_resource_bundler/filters/cdn_filter.rb",
     "lib/web_resource_bundler/filters/image_encode_filter.rb",
     "lib/web_resource_bundler/filters/image_encode_filter/css_generator.rb",
     "lib/web_resource_bundler/filters/image_encode_filter/image_data.rb",
     "lib/web_resource_bundler/rails_app_helpers.rb",
     "lib/web_resource_bundler/settings.rb",
     "lib/web_resource_bundler/web_resource_bundler_init.rb",
     "spec/bundler.log",
     "spec/log/web_resource_bundler.log",
     "spec/public/foo.css",
     "spec/public/images/good.jpg",
     "spec/public/images/logo.jpg",
     "spec/public/images/sdfo.jpg",
     "spec/public/images/too_big_image.jpg",
     "spec/public/log/web_resource_bundler.log",
     "spec/public/marketing.js",
     "spec/public/salog20.js",
     "spec/public/sample.css",
     "spec/public/seal.js",
     "spec/public/set_cookies.js",
     "spec/public/styles/boo.css",
     "spec/public/styles/for_import.css",
     "spec/public/temp.css",
     "spec/public/test.css",
     "spec/sample_block_helper.rb",
     "spec/spec_helper.rb",
     "spec/web_resource_bundler/content_management/block_data_spec.rb",
     "spec/web_resource_bundler/content_management/block_parser_spec.rb",
     "spec/web_resource_bundler/content_management/css_url_rewriter_spec.rb",
     "spec/web_resource_bundler/content_management/resource_file_spec.rb",
     "spec/web_resource_bundler/file_manager_spec.rb",
     "spec/web_resource_bundler/filters/bundle_filter/filter_spec.rb",
     "spec/web_resource_bundler/filters/bundle_filter/resource_packager_spec.rb",
     "spec/web_resource_bundler/filters/cdn_filter_spec.rb",
     "spec/web_resource_bundler/filters/image_encode_filter/css_generator_spec.rb",
     "spec/web_resource_bundler/filters/image_encode_filter/filter_spec.rb",
     "spec/web_resource_bundler/filters/image_encode_filter/image_data_spec.rb",
     "spec/web_resource_bundler/settings_spec.rb",
     "spec/web_resource_bundler/web_resource_bundler_spec.rb",
     "web_resource_bundler.gemspec"
  ]
  s.homepage = %q{http://github.com/gregolsen/web-bundler}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{lib for css and js content bundling and managment}
  s.test_files = [
    "spec/web_resource_bundler/filters/image_encode_filter/filter_spec.rb",
     "spec/web_resource_bundler/filters/image_encode_filter/css_generator_spec.rb",
     "spec/web_resource_bundler/filters/image_encode_filter/image_data_spec.rb",
     "spec/web_resource_bundler/filters/cdn_filter_spec.rb",
     "spec/web_resource_bundler/filters/bundle_filter/filter_spec.rb",
     "spec/web_resource_bundler/filters/bundle_filter/resource_packager_spec.rb",
     "spec/web_resource_bundler/web_resource_bundler_spec.rb",
     "spec/web_resource_bundler/file_manager_spec.rb",
     "spec/web_resource_bundler/settings_spec.rb",
     "spec/web_resource_bundler/content_management/css_url_rewriter_spec.rb",
     "spec/web_resource_bundler/content_management/block_data_spec.rb",
     "spec/web_resource_bundler/content_management/resource_file_spec.rb",
     "spec/web_resource_bundler/content_management/block_parser_spec.rb",
     "spec/sample_block_helper.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["= 1.3.1"])
    else
      s.add_dependency(%q<rspec>, ["= 1.3.1"])
    end
  else
    s.add_dependency(%q<rspec>, ["= 1.3.1"])
  end
end

