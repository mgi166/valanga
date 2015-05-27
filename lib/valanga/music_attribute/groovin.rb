module Valanga
  class MusicAttribute
    class Groovin < Base
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

      def basic
        Hash[GROOVIN_KEY.zip(music_info_box[1])]
      end

      def medium
        Hash[GROOVIN_KEY.zip(music_info_box[2])]
      end

      def hard
        Hash[GROOVIN_KEY.zip(music_info_box[3])]
      end

      def special
        Hash[GROOVIN_KEY.zip(music_info_box[4])] if has_special?
      end
    end
  end
end