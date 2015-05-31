require 'forwardable'

module Valanga
  class Music
    class Base
      extend Forwardable

      def initialize(music)
        @music = music
      end

      def_delegators :@music, :has_special?, :name, :artist, :music_info_box, :music_bk
    end
  end
end
