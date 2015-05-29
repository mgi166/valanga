module Valanga
  class Music
    def initialize(document)
      @document = Nokogiri::HTML.parse(document)
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

    def music_bk
      return @music_bk if defined? @music_bk

      music_bk = @document.css("div.music_bk dl")

      unless music_bk.size == 8 || music_bk.size == 9
        raise NoMusicInformationError, "Not found music informations"
      end

      @music_bk = music_bk
    end
  end
end
