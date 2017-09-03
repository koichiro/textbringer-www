class Textbringer::Www::SaxHander

  def initialize
    @content = []
    @link_attr = {}

    @node_on_methods = {
      "a" => lambda{|name, attrs|
        @link_attr["href"] = attrs["href"]
      },
    }

    @node_after_methods = {
      "a" => lambda{|name|
        @content << "[#{@link_attr["text"]}](#{@link_attr["href"]})"
        @link_attr["href"] = nil
      },
      "p" => lambda{|name|
        @content << "\n"
      },
    }

  end

  def on_element ns, name, attrs={}
    if @node_on_methods.key?(name)
      @node_on_methods[name].call(name, attrs)
    end
  end

  def after_element ns, name
    if @node_after_methods.key?(name)
      @node_after_methods[name].call(name)
    end
  end

  def on_text(text)
    if @link_attr["href"]
      @link_attr["text"] = text
      return
    end
    return if text == "\n"
    @content << text
  end

  def text
    @content.join.to_s
  end
end
