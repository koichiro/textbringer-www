# frozen_string_literal: true

module Textbringer

  class WwwMode < FundamentalMode
    #define_generic_command :www_mode

    # キーバインド
    WWW_MODE_MAP = Keymap.new
    WWW_MODE_MAP.define_key("\C-x\C-h", :www_help_command)

    def initialize(buffer)
      super(buffer)
      buffer.keymap = WWW_MODE_MAP
    end
  end

end
