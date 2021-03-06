module Valanga
  class Music
    def initialize(document)
      @document = Nokogiri::HTML.parse(document, nil, 'Shift_JIS')
      @music_bk = @document.css("div.music_bk dl")

      unless @music_bk.size == 8 || @music_bk.size == 9
        raise NoMusicInformationError, "Not found music informations"
      end
    end

    attr_reader :music_bk

    def basic
      Difficulty::Basic.new(self)
    end

    def medium
      Difficulty::Medium.new(self)
    end

    def hard
      Difficulty::Hard.new(self)
    end

    def special
      Difficulty::Special.new(self)
    end

    def collete
      Collete.new(self)
    end

    def groovin
      Groovin.new(self)
    end

    def has_special?
      music_bk.size == 9
    end

    def name
      @name ||= @document.css("div.music_dataname h6").text
    end

    def artist
      @artist ||= @document.css("div.music_artist h6").text
    end

    private

    def music_info_box
      @music_info_box ||= music_bk.map do |dl|
        dl.children.select(&:element?).map do |ele|
          if (img = ele.search('img')).empty?
            ele.text
          else
            img.attribute('src').value
          end
        end
      end
    end
  end
end
