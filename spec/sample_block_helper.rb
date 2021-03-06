class SampleBlockHelper
  def initialize(styles, scripts, settings)
    @styles = styles
    @scripts = scripts
    @settings = settings
  end
  
  def construct_js_link(path)
    "<script src = \"#{path}\" type=\"text/javascript\"></script>"
  end

  def construct_css_link(path)
    "<link href = \"#{path}\" media=\"screen\" rel=\"Stylesheet\" type=\"text/css\" />"
  end

  def sample_inline_block
    "this is inline block content" +
        "<script>abracadabra</script><style>abracadabra</style>"
  end

  def construct_links_block(styles, scripts)
    block = ""
    styles.each do |path|
      block += construct_css_link(path)
    end
    scripts.each do |path|
      block += construct_js_link(path)
    end
    block
  end

  def construct_resource_file(file, content, type)
    resource_file = WebResourceBundler::ResourceFile.new(file, '', type)
    if content
      resource_file.content = content
    else
      resource_file.content = File.read(File.join(@settings[:resource_dir], file))
    end
    resource_file
  end

  def sample_cond_block
    "<!-- [if IE 7] >" +
    construct_links_block(@styles[(@styles.size / 2)..-1], @scripts[(@scripts.size / 2)..-1]) +
    sample_inline_block +
    "<! [endif] -->"
  end

  def sample_block
    block = construct_links_block(@styles[0..(@styles.size / 2 - 1)], @scripts[0..(@scripts.size / 2 - 1)]) + "\n"
    block += sample_inline_block
    block += sample_cond_block
  end

  def sample_block_data
    data = BlockData.new
    @styles[0..(@styles.size / 2 - 1)].each do |file|
      data.files << construct_resource_file(file, nil, ResourceFileType::CSS)
    end
    @scripts[0..(@scripts.size / 2 - 1)].each do |file|
      data.files << construct_resource_file(file, nil, ResourceFileType::JS)
    end
    data.inline_block = sample_inline_block
    data.child_blocks << child_block_data
    data
  end

  def child_block_data
    child = BlockData.new("[if IE 7]")
    @styles[(@styles.size / 2)..(@styles.size - 1)].each do |file|
      child.files << construct_resource_file(file, nil, ResourceFileType::CSS)
    end
    @scripts[(@scripts.size / 2)..(@scripts.size - 1)].each do |file|
      child.files << construct_resource_file(file, nil, ResourceFileType::JS)
    end
    child.inline_block = sample_inline_block
    child
  end

end

