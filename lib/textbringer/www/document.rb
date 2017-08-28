require 'nokogiri'

class Textbringer::Www::Document < Nokogiri::XML::SAX::Document
  def initialize
    @content = nil
  end

  def start_element name, attr=[]
  end

  def end_element name
  end

  def text
    @content.to_s
  end
end
