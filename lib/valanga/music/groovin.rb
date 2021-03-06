module Valanga
  class Music
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
        Valanga::MusicAttribute.new(create_attr(1))
      end

      def medium
        Valanga::MusicAttribute.new(create_attr(2))
      end

      def hard
        Valanga::MusicAttribute.new(create_attr(3))
      end

      def special
        if has_special?
          Valanga::MusicAttribute.new(create_attr(4))
        end
      end

      private

      def create_attr(index)
        Hash[GROOVIN_KEY.zip(music_info_box[index])].merge(
          'name'   => name,
          'artist' => artist,
        )
      end
    end
  end
end
