require "test_helper"

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

    handler = Textbringer::Www::SaxHandler.new
    Oga.sax_parse_html(handler, html)
    assert handler.text
  end
end
