module Valanga
  module Difficulty
    class Medium
      def initialize(music)
        @collete = music.collete.medium
        @groovin = music.groovin.medium
      end

      def difficulty
        'MEDIUM'
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

      def achievement_rate
        if @groovin.achievement_rate >= @collete.achievement_rate
          @groovin.achievement_rate
        else
          @collete.achievement_rate
        end
      end

      def miss_count
        if [@groovin.miss_count, @collete.miss_count].all?
          if @groovin.miss_count >= @collete.miss_count
            @collete.miss_count
          else
            @groovin.miss_count
          end
        else
          @groovin.miss_count || @collete.miss_count
        end
      end

      def play_count
        if @groovin.play_count >= @collete.play_count
          @groovin.play_count
        else
          @collete.play_count
        end
      end

      def clear
        @groovin.clear || @collete.clear
      end

      def full_combo
        @groovin.full_combo || @collete.full_combo
      end
    end
  end
end
