require File.absolute_path(File.join(File.dirname(__FILE__), "../../spec_helper"))
require 'digest/md5'
describe WebResourceBundler::BundleFilter::ResourcePackager do
    before(:each) do
      @file_packager = BundleFilter::ResourcePackager.new @settings
      @file_paths = @styles.map do |url|
        File.join(@settings.resource_dir, url)
      end
      @css_resource = ResourceBundle::Data.new(ResourceBundle::CSS, @styles)
      @js_resource = ResourceBundle::Data.new(ResourceBundle::JS, @scripts)
    end

    describe "#bundle_resource" do
      it "creates bundle file from files passed with specific name" do
        filepath = @file_packager.bundle_resource(@css_resource)
        File.exist?(File.join(@settings.resource_dir, filepath)).should be_true
      end
      it "creates bundle file containing all files content" do
        pending
      end
    end

    describe "#bundle_file_path" do
      it "returns path of bundle file" do
        name = "sample_file.css"
        path = File.join(@settings.resource_dir, @settings.cache_dir, name) 
        @file_packager.bundle_file_path(name).should == path
      end
    end

    describe "#file_path" do
      it "returns resource file path using url from html" do
        @styles.each do |url|
          @file_packager.file_path(url).should == File.join(@settings.resource_dir, url)   
        end
      end
    end

    describe "#resource_exist?" do
      it "return true if resource with given url exist in resource dir" do
        @styles.each do |url|
          @file_packager.resource_exist?(url).should be_true
        end
      end
    end

    describe "#bundle_file_exist?" do
      it "return true if bundle file exist in resource dir" do
        @file_packager.bundle_resource(@css_resource)
        @file_packager.bundle_file_exist?(@css_resource.bundle_filename(@settings)).should be_true
      end
    end

    describe "#bundle_upto_date?" do

      before(:each) do
        sleep 0.1
        @file_packager.bundle_resource(@css_resource)
      end

      it "returns true if bundle file exist and its change date later than change date of each file in bundle" do
        @file_packager.bundle_upto_date?(@css_resource).should be_true
      end

      it "returns false if one of resource files was changed" do
        system("touch #{@file_packager.file_path(@css_resource.files[0])} -m")
        @file_packager.bundle_upto_date?(@css_resource).should be_false
      end

      it "returns false if bundle file was deleted" do
        @file_packager.bundle_upto_date?(@css_resource).should be_true
        File.delete(@file_packager.bundle_file_path(@css_resource.bundle_filename(@settings)))
        @file_packager.bundle_file_exist?(@css_resource.bundle_filename(@settings)).should be_false
        @file_packager.bundle_upto_date?(@css_resource).should be_false
      end
    end
    
  end
