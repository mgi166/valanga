module Valanga
  class Music
    class Collete < Base
      COLLETE_KEY = %w(
        rank
        score
        achievement_rate
        miss_count
        play_count
      )

      def basic
        if has_special?
          MusicAttribute.new(create_attr(6))
        else
          MusicAttribute.new(create_attr(5))
        end
      end

      def medium
        if has_special?
          MusicAttribute.new(create_attr(7))
        else
          MusicAttribute.new(create_attr(6))
        end
      end

      def hard
        if has_special?
          MusicAttribute.new(create_attr(8))
        else
          MusicAttribute.new(create_attr(7))
        end
      end

      private

      def create_attr(index)
        Hash[COLLETE_KEY.zip(music_info_box[index])]
      end
    end
  end
end
