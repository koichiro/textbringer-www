module Textbringer::Www

  class SaxHandler

    class StackNode < Struct.new(:object, :text)
      def initialize(object, text = nil)
        self.object = object
        self.text = text
      end
    end
                       
    def initialize
      @stack = [ StackNode.new("Root") ]
      @elements []
    end

    def sax_parse(html)
      Oga.sax_parse_html(self, html)
    end

    def on_text(text)
      node = stack.last

      if node.text
        node.text << text
      else
        node.text = text.dup
      end
    end

    def on_element(ns, name, attrs={})
      name = node_name(ns, name)
      stack.push(StackNode.new(name))
    end

    def after_element ns, name
      stack.pop
    end

    def on_text(text)
    end

    def text
      r = ""
      r = "Title: #{@title}" if @title
      r += @content.join.to_s
      r
    end

    def stack
      @stack
    end

    private

    def node_name(ns, name)
      ns ? "#{ns}:#{name}" : name
    end
  end
end
