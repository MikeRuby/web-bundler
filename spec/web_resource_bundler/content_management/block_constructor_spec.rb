require File.expand_path(File.join(File.dirname(__FILE__), "../../spec_helper"))
describe WebResourceBundler::BlockConstructor do
  describe "#construct_css_link" do
    it "constructs proper html link to css file" do
      BlockConstructor.construct_css_link('/styles/1.css').should == "<link href = \"/styles/1.css\" media=\"screen\" rel=\"Stylesheet\" type=\"text/css\" />"
    end
  end

  describe "#construct_css_link" do
    it "constructs proper html link to js file" do
      BlockConstructor.construct_js_link('/scripts/cool.js').should == "<script src = \"/scripts/cool.js\" type=\"text/javascript\"></script>"
    end
  end

  describe "#construct_block" do
    it "constructs html block using block data structure" do
      block_data = @sample_block_helper.sample_block_data
      block_data.css.files = [block_data.css.files[0]]
      block_data.js.files = [block_data.js.files[0]]
      block_data.child_blocks[0].js.files = [block_data.child_blocks[0].js.files[0]] 
      block_data.child_blocks[0].css.files = [block_data.child_blocks[0].css.files[0]]
      sample_block = @sample_block_helper.sample_block
      result = BlockConstructor.construct_block(block_data)
      result.should == "<link href = \"/sample.css\" media=\"screen\" rel=\"Stylesheet\" type=\"text/css\" />\n<script src = \"/set_cookies.js\" type=\"text/javascript\"></script>\nthis is inline block content<script>abracadabra</script><style>abracadabra</style><!--[if IE 7]><link href = \"/sample.css\" media=\"screen\" rel=\"Stylesheet\" type=\"text/css\" />\n<script src = \"/set_cookies.js\" type=\"text/javascript\"></script>\nthis is inline block content<script>abracadabra</script><style>abracadabra</style><![endif]-->"
    end
  end

end
