module Valanga
  module Difficulty
    class Base
      def name
        groovin.name || collete.name
      end

      def artist
        groovin.artist || collete.artist
      end

      def rank
        groovin.rank || collete.rank
      end

      def score
        if groovin.score >= collete.score
          groovin.score
        else
          collete.score
        end
      end

      def achievement_rate
        if groovin.achievement_rate >= collete.achievement_rate
          groovin.achievement_rate
        else
          collete.achievement_rate
        end
      end

      def miss_count
        if [groovin.miss_count, collete.miss_count].all?
          if groovin.miss_count >= collete.miss_count
            collete.miss_count
          else
            groovin.miss_count
          end
        else
          groovin.miss_count || collete.miss_count
        end
      end

      def play_count
        groovin.play_count + collete.play_count
      end

      def clear
        groovin.clear || collete.clear
      end

      def full_combo
        groovin.full_combo || collete.full_combo
      end

      def cleared?
        achievement_rate && 70.0 <= achievement_rate
      end

      def played?
        play_count > 0
      end

      def full_combo?
        ! full_combo.nil?
      end
    end
  end
end
