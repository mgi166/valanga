module Valanga
  class MusicAttribute
    class Groovin
      GROOVIN_KEY = %w(
        difficulty
        rank
        score
        achievement_rate
        miss_count
        play_count
        clear
        full_combo
      )

      def initialize(attribute)
        @attribute = attribute
      end

      def groovin_basic
        Hash[GROOVIN_KEY.zip(music_info_box[1])]
      end

      def groovin_medium
        Hash[GROOVIN_KEY.zip(music_info_box[2])]
      end

      def groovin_hard
        Hash[GROOVIN_KEY.zip(music_info_box[3])]
      end

      def groovin_special
        Hash[GROOVIN_KEY.zip(music_info_box[4])] if has_special?
      end
    end
  end
end
