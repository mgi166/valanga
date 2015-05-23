module Valanga
  class Music
    MUSIC_INDEX = "https://p.eagate.573.jp/game/reflec/groovin/p/music/index.html"

    def initialize(session)
      @session = session
    end

    def list_musics(page: nil)
      @session.visit(music_url(page: page))
      page = Nokogiri::HTML.parse(@session.html)
      page.css("#music_table1 td.music_jkimg a").map(&:text).map(&:strip)
    end

    private

    def music_url(page: nil)
      if page && !(page.is_a? Integer)
        raise ArgumentError, "page is expected to be Integer"
      end

      URI.parse(MUSIC_INDEX).tap do |u|
        u.query = "page=#{page}" if page
      end
    end
  end
end
