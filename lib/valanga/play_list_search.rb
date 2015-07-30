module Valanga
  module PlayListSearch
    MUSIC_PLAY_LIST = "http://p.eagate.573.jp/game/reflec/groovin/p/music/playlist.html"

    def history(num = 4)
    end

    private

    def play_history
      @play_history ||= (
        @session.visit MUSIC_PLAY_LIST
        Nokogiri::HTML.parse(@session.body).css("#mybest_list tr").shift
      )
    end
  end
end
