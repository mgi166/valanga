require 'ostruct'

module Valanga
  class MusicAttribute < OpenStruct
    def initialize(attribute)
      super
      attr = attribute.dup.extend(Transformable)

      self.rank  = attr.rank
      self.score = attr.score
      self.achievement_rate = attr.achievement_rate
      self.miss_count = attr.miss_count
      self.play_count = attr.play_count
      self.clear = attr.clear
      self.full_combo = attr.full_combo
    end

    module Transformable
      IMAGE_TEXT = {
        "/game/reflec/groovin/p/images/music/rank/syousai_1.png" => "B",
        "/game/reflec/groovin/p/images/music/rank/syousai_2.png" => "A",
        "/game/reflec/groovin/p/images/music/rank/syousai_3.png" => "AA",
        "/game/reflec/groovin/p/images/music/rank/syousai_4.png" => "AAA",
        "/game/reflec/groovin/p/images/music/rank/syousai_5.png" => "AAA+",
        "../images/music/fullcombo_img1.gif"                     => "full_combo",
        "../images/music/fullcombo_img2.gif"                     => "all_just_reflec_full_combo",
        "../images/music/d_clear_typ_0.gif"                      => "clear",
        "../images/music/d_clear_typ_1.gif"                      => "hard_clear",
        "../images/music/d_clear_typ_2.gif"                      => "super_hard_clear",
      }

      def rank
        text = IMAGE_TEXT.fetch(self['rank'], self['rank'])
        text == '-' ? nil : text
      end

      def score
        self['score'].to_i
      end

      def achievement_rate
        self['achievement_rate'].sub('%', '').to_f
      end

      def miss_count
        self['miss_count'].to_i
      end

      def play_count
        self['play_count'].to_i
      end

      def clear
        text = IMAGE_TEXT.fetch(self['clear'], self['clear'])
        text == '-' ? nil : text
      end

      def full_combo
        text = IMAGE_TEXT.fetch(self['full_combo'], self['full_combo'])

        if text == '-'
          nil
        elsif text
          text
        else play_count > 0 && miss_count.zero?
          'full_combo'
        end
      end
    end
  end
end
