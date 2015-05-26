module Valanga
  class MusicAttribute
    COLLETE_KEY = %w(
      rank
      score
      achievement_rate
      miss_count
      play_count
    )

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

    def initialize(document)
      @document = Nokogiri::HTML.parse(document)
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

    def collete_basic
      has_special? ? Hash[COLLETE_KEY.zip(music_info_box[6])] : Hash[COLLETE_KEY.zip(music_info_box[5])]
    end

    def collete_medium
      has_special? ? Hash[COLLETE_KEY.zip(music_info_box[7])] : Hash[COLLETE_KEY.zip(music_info_box[6])]
    end

    def collete_hard
      has_special? ? Hash[COLLETE_KEY.zip(music_info_box[8])] : Hash[COLLETE_KEY.zip(music_info_box[7])]
    end

    def has_special?
      music_bk.size == 9
    end

    private

    def music_info_box
      @music_info_box ||= music_bk.map do |dl|
        dl.children.select(&:element?).map do |ele|
          value = (img = ele.search('img')).empty? ? ele.text : img.attribute('src').value
          image_text[value] || value
        end
      end
    end

    def music_bk
      @music_bk ||= @document.css("div.music_bk dl")
    end
  end
end
