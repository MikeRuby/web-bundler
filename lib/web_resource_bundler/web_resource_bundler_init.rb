WebResourceBundler::Bundler.init
WebResourceBundler::Bundler.setup(Rails.root, Rails.env)
ActionView::Base.send(:include, WebResourceBundler::RailsAppHelpers)

