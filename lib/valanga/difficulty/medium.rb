module Valanga
  module Difficulty
    class Medium < Base
      attr_reader :collete, :groovin

      def initialize(music)
        @collete = music.collete.medium
        @groovin = music.groovin.medium
      end

      def difficulty
        'MEDIUM'
      end
    end
  end
end
