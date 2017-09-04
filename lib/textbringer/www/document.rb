class Textbringer::Www::SaxHander

  def initialize
    @title = nil
    @content = []
    @link_attr = {}
    @body_open = false
    @tilte_opne = false

    @node_on_methods = {
      "a" => lambda {|name, attrs|
        @link_attr["href"] = attrs["href"]
      },
      "body" => lambda {|name, attrs|
        @body_open = true
      },
      "title" => lambda {|name, attrs|
        @title_open = true
      },
    }

    @node_after_methods = {
      "a" => lambda {|name|
        @content << "[#{@link_attr["text"]}](#{@link_attr["href"]})"
        @link_attr["href"] = nil
      },
      "p" => lambda {|name|
        @content << "\n"
      },
      "body" => lambda {|name|
        @body_open = false
      },
      "title" => lambda {|name|
        @tilte_open = false
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
    @title = text if @title_open
    return unless @body_open
    if @link_attr["href"]
      @link_attr["text"] = text
      return
    end
    return if text == "\n"
    @content << text
  end

  def text
    r = ""
    r = "Title: #{@title}" if @title
    r += @content.join.to_s
    r
  end
end
