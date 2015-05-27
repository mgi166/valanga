require 'forwardable'

module Valanga
  class MusicAttribute
    class Base
      extend Forwardable

      def initialize(attribute)
        @attribute = attribute
      end

      def_delegators :@attribute, :has_special?, :music_info_box, :music_bk
    end
  end
end
