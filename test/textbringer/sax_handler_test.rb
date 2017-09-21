require "test_helper"
require "textbringer/www"

class Textbringer::Www::SaxHandlerTest < Minitest::Test

  def test_parser
    html = <<-EOS
<html>
  <head>
    <title>Test Potal Site</title>
  </head>
  <body>
    <p>Hello World.</p>
  </body>
</html>
    EOS

    handler = Textbringer::Www::SaxHandler.new(self)
    handler.sax_parse(html)
    p handler.stack
    p handler.text
    assert handler.text
  end
end