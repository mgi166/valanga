require 'forwardable'

module Valanga
  module Difficulty
    class Special < Base
      extend Forwardable

      def initialize(music)
        @groovin = music.groovin.special
      end

      def_delegators :@groovin, :rank, :score, :achievement_rate, :miss_count, :play_count, :clear, :full_combo

      def difficulty
        'SPECIAL'
      end
    end
  end
end
