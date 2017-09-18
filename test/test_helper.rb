$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "simplecov"

require "textbringer"

SimpleCov.profiles.define "textbringer-www" do
  add_filter "/test/"
end
SimpleCov.start("textbringer-www")

include Textbringer
include Commands

require "minitest/autorun"
