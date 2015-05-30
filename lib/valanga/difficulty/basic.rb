module Valanga
  module Difficulty
    class Basic < Base
      attr_reader :collete, :groovin

      def initialize(music)
        @collete = music.collete.basic
        @groovin = music.groovin.basic
      end

      def difficulty
        'BASIC'
      end
    end
  end
end
