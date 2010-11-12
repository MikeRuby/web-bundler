# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{web_resource_bundler}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["gregolsen"]
  s.date = %q{2010-11-12}
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
     "lib/web_resource_bundler/content_management/bundled_content_constructor.rb",
     "lib/web_resource_bundler/content_management/css_url_rewriter.rb",
     "lib/web_resource_bundler/content_management/resource_bundle.rb",
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
     "spec/public/foo.css",
     "spec/public/images/good.jpg",
     "spec/public/images/logo.jpg",
     "spec/public/images/sdfo.jpg",
     "spec/public/images/too_big_image.jpg",
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
     "spec/spec.log",
     "spec/spec_helper.rb",
     "spec/web_resource_bundler/content_management/block_data_spec.rb",
     "spec/web_resource_bundler/content_management/block_parser_spec.rb",
     "spec/web_resource_bundler/content_management/bundled_content_constructor_spec.rb",
     "spec/web_resource_bundler/content_management/css_url_rewriter_spec.rb",
     "spec/web_resource_bundler/file_manager_spec.rb",
     "spec/web_resource_bundler/filters/bundle_filter/filter_spec.rb",
     "spec/web_resource_bundler/filters/bundle_filter/resource_packager_spec.rb",
     "spec/web_resource_bundler/filters/cdn_filter_spec.rb",
     "spec/web_resource_bundler/filters/image_encode_filter/css_generator_spec.rb",
     "spec/web_resource_bundler/filters/image_encode_filter/filter_spec.rb",
     "spec/web_resource_bundler/filters/image_encode_filter/image_data_spec.rb",
     "spec/web_resource_bundler/settings_spec.rb",
     "spec/web_resource_bundler/web_resource_bundler_spec.rb",
     "test_app/bundler_test/.gitignore",
     "test_app/bundler_test/Gemfile",
     "test_app/bundler_test/Gemfile.lock",
     "test_app/bundler_test/README",
     "test_app/bundler_test/Rakefile",
     "test_app/bundler_test/app/controllers/application_controller.rb",
     "test_app/bundler_test/app/controllers/items_controller.rb",
     "test_app/bundler_test/app/helpers/application_helper.rb",
     "test_app/bundler_test/app/helpers/items_helper.rb",
     "test_app/bundler_test/app/models/item.rb",
     "test_app/bundler_test/app/views/items/_form.html.erb",
     "test_app/bundler_test/app/views/items/edit.html.erb",
     "test_app/bundler_test/app/views/items/index.html.erb",
     "test_app/bundler_test/app/views/items/new.html.erb",
     "test_app/bundler_test/app/views/items/show.html.erb",
     "test_app/bundler_test/app/views/layouts/application.html.erb",
     "test_app/bundler_test/config.ru",
     "test_app/bundler_test/config/application.rb",
     "test_app/bundler_test/config/boot.rb",
     "test_app/bundler_test/config/database.yml",
     "test_app/bundler_test/config/environment.rb",
     "test_app/bundler_test/config/environments/development.rb",
     "test_app/bundler_test/config/environments/production.rb",
     "test_app/bundler_test/config/environments/test.rb",
     "test_app/bundler_test/config/initializers/backtrace_silencers.rb",
     "test_app/bundler_test/config/initializers/inflections.rb",
     "test_app/bundler_test/config/initializers/mime_types.rb",
     "test_app/bundler_test/config/initializers/secret_token.rb",
     "test_app/bundler_test/config/initializers/session_store.rb",
     "test_app/bundler_test/config/initializers/web_resource_bundler_init.rb",
     "test_app/bundler_test/config/locales/en.yml",
     "test_app/bundler_test/config/routes.rb",
     "test_app/bundler_test/db/migrate/20101107200125_create_items.rb",
     "test_app/bundler_test/db/schema.rb",
     "test_app/bundler_test/db/seeds.rb",
     "test_app/bundler_test/doc/README_FOR_APP",
     "test_app/bundler_test/lib/tasks/.gitkeep",
     "test_app/bundler_test/public/404.html",
     "test_app/bundler_test/public/422.html",
     "test_app/bundler_test/public/500.html",
     "test_app/bundler_test/public/favicon.ico",
     "test_app/bundler_test/public/images/big_image.png",
     "test_app/bundler_test/public/images/ie8-logo.png",
     "test_app/bundler_test/public/images/rails.png",
     "test_app/bundler_test/public/javascripts/application.js",
     "test_app/bundler_test/public/javascripts/controls.js",
     "test_app/bundler_test/public/javascripts/dragdrop.js",
     "test_app/bundler_test/public/javascripts/effects.js",
     "test_app/bundler_test/public/javascripts/prototype.js",
     "test_app/bundler_test/public/javascripts/rails.js",
     "test_app/bundler_test/public/robots.txt",
     "test_app/bundler_test/public/stylesheets/.gitkeep",
     "test_app/bundler_test/public/stylesheets/ie_only.css",
     "test_app/bundler_test/public/stylesheets/scaffold.css",
     "test_app/bundler_test/script/rails",
     "test_app/bundler_test/test/fixtures/items.yml",
     "test_app/bundler_test/test/functional/items_controller_test.rb",
     "test_app/bundler_test/test/performance/browsing_test.rb",
     "test_app/bundler_test/test/test_helper.rb",
     "test_app/bundler_test/test/unit/helpers/items_helper_test.rb",
     "test_app/bundler_test/test/unit/item_test.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/content_management/block_data.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/content_management/block_parser.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/content_management/bundled_content_constructor.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/content_management/css_url_rewriter.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/content_management/resource_bundle.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/exceptions.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/file_manager.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/filters.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/filters/base_filter.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/filters/bundle_filter.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/filters/bundle_filter/resource_packager.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/filters/cdn_filter.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/filters/image_encode_filter.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/filters/image_encode_filter/css_generator.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/filters/image_encode_filter/image_data.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/rails_app_helpers.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/settings.rb",
     "test_app/bundler_test/vendor/plugins/web_resource_bundler/lib/web_resource_bundler/web_resource_bundler_init.rb",
     "web_resource_bundler.gemspec"
  ]
  s.homepage = %q{http://github.com/gregolsen/web_resource_bundler}
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
     "spec/web_resource_bundler/content_management/bundled_content_constructor_spec.rb",
     "spec/web_resource_bundler/content_management/block_parser_spec.rb",
     "spec/sample_block_helper.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end
