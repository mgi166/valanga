require 'ostruct'

module Valanga
  class MusicAttribute < OpenStruct
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

    def initialize(attribute)
      super
    end
  end
end
