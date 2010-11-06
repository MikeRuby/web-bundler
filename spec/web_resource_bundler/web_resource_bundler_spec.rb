require File.expand_path(File.join(File.dirname(__FILE__), "../spec_helper"))
module WebResourceBundler
  describe Bundler do

    before(:each) do
      @bundler = WebResourceBundler::Bundler.new(@settings_hash)
    end

    describe "#process" do
      it "process block" do
        @bundler.process @sample_block_helper.sample_block
      end
    end

    describe "#bundle_upto_date?" do
      it "returns true if block was already bundled and resulted files exist" do
        clean_cache_dir
        @bundler.process(@sample_block_helper.sample_block)
        @bundler.bundle_upto_date?(@bundler.build_filters, @sample_block_helper.sample_block_data)
      end
    end

    describe "#build_filters" do
      it "creates filters array according to settings" do
        @settings_hash[:encode_images] = true
        @settings_hash[:bundle_files] = true
        @settings_hash[:use_cdn] = false
        @bundler.build_filters.size.should == 2
        @settings_hash[:encode_images] = false
        @settings_hash[:bundle_files] = false
        @settings_hash[:use_cdn] = false
        @bundler = WebResourceBundler::Bundler.new @settings_hash
        @bundler.build_filters.size.should == 0
      end
      it "if both cdn and base64 filters applied, only base64 should be used" do
        @settings_hash[:encode_images] = true
        @settings_hash[:bundle_files] = true
        @settings_hash[:use_cdn] = true
        @bundler = WebResourceBundler::Bundler.new @settings_hash
        @bundler.build_filters.size.should == 2
      end
    end

    describe "#read_resources!" do
      it "populates block_data resource files structure with files content" do
        block_data = @sample_block_helper.sample_block_data
        @bundler.read_resources!(block_data)
        all_files = block_data.css.files.merge(block_data.js.files).merge(block_data.child_blocks[0].css.files).merge(block_data.child_blocks[0].js.files)
        all_files.each_pair do |path, content|
          File.read(File.join(@settings.resource_dir, path)).should == content
        end
      end
    end

  end
end
