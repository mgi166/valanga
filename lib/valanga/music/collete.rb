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
          MusicAttribute.new(create_attr(6)).tap do |attr|
            attr.name   = name
            attr.artist = artist
          end
        else
          MusicAttribute.new(create_attr(5)).tap do |attr|
            attr.name   = name
            attr.artist = artist
          end
        end
      end

      def medium
        if has_special?
          MusicAttribute.new(create_attr(7)).tap do |attr|
            attr.name   = name
            attr.artist = artist
          end
        else
          MusicAttribute.new(create_attr(6)).tap do |attr|
            attr.name   = name
            attr.artist = artist
          end
        end
      end

      def hard
        if has_special?
          MusicAttribute.new(create_attr(8)).tap do |attr|
            attr.name   = name
            attr.artist = artist
          end
        else
          MusicAttribute.new(create_attr(7)).tap do |attr|
            attr.name   = name
            attr.artist = artist
          end
        end
      end

      private

      def create_attr(index)
        Hash[COLLETE_KEY.zip(music_info_box[index])]
      end
    end
  end
end
