module Valanga
  module Difficulty
    class Basic
      def initialize(music)
        @collete = music.collete.basic
        @groovin = music.groovin.basic
      end

      def difficulty
        'BASIC'
      end

      def rank
        @groovin.rank || @collete.rank
      end

      def score
        if @groovin.score >= @collete.score
          @groovin.score
        else
          @collete.score
        end
      end
    end
  end
end
