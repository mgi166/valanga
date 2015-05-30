module Valanga
  module Difficulty
    class Hard < Base
      attr_reader :collete, :groovin

      def initialize(music)
        @collete = music.collete.hard
        @groovin = music.groovin.hard
      end

      def difficulty
        'HARD'
      end
    end
  end
end
