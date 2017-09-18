require "test_helper"
require "textbringer/www"

class Textbringer::WwwTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Textbringer::Www::VERSION
  end
end
