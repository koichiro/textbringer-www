require 'uri'
require 'open-uri'
require 'oga'

require_relative 'sax_handler'

class Textbringer::Www::Client
  def initialize url
    @uri = URI.parse(url)

    charset = nil
    html = open(@uri.to_s) do |f|
      charset = f.charset
      f.read
    end

    @hander = Www::SaxHandler.new
    Oga.sax_parse_html(@hander, html)
    new_buffer_from_html
  end

  # TODO: Nokogiri saxパーサーでテキストを組み立てる
  def new_buffer_from_html
    buffer = Buffer["*www*"] || Buffer.new_buffer("*www*", undo_limit: 0)
    buffer.read_only = false
    buffer.insert(@hander.text)
    switch_to_buffer(buffer)
    buffer.read_only = true
    goto_char(0)
    www_mode
  end
end
