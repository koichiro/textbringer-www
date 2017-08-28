require 'uri'
require 'open-uri'
require 'nokogiri'

require_relative 'document'

class Textbringer::Www::Client
  def initialize url
    @uri = URI.parse(url)

    charset = nil
    html = open(@uri.to_s) do |f|
      charset = f.charset
      f.read
    end

    parser = Nokogiri::HTML::SAX::Parser.new(Www::Document.new)
    @doc = parser.parse_memory(html, charset)
    new_buffer_from_html
  end

  # TODO: Nokogiri saxパーサーでテキストを組み立てる
  def new_buffer_from_html
    buffer = Buffer["*Www*"] || Buffer.new_buffer("*Www*", undo_limit: 0)
    buffer.read_only = false
    buffer.insert(@doc.text)
    switch_to_buffer(buffer)
    buffer.read_only = true
    beginning_of_line
    www_mode
  end
end
