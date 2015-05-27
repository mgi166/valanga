module Valanga
  class MusicAttribute
    class Collete < Base
      COLLETE_KEY = %w(
        rank
        score
        achievement_rate
        miss_count
        play_count
      )

      def collete_basic
        has_special? ? Hash[COLLETE_KEY.zip(music_info_box[6])] : Hash[COLLETE_KEY.zip(music_info_box[5])]
      end

      def collete_medium
        has_special? ? Hash[COLLETE_KEY.zip(music_info_box[7])] : Hash[COLLETE_KEY.zip(music_info_box[6])]
      end

      def collete_hard
        has_special? ? Hash[COLLETE_KEY.zip(music_info_box[8])] : Hash[COLLETE_KEY.zip(music_info_box[7])]
      end
    end
  end
end
