module Valanga
  class Music
    MUSIC_INDEX = "https://p.eagate.573.jp/game/reflec/groovin/p/music/index.html"

    def initialize(session)
      @session = session
    end

    def list_musics(page: nil, sorttype: nil)
      @session.visit(music_url(page: page, sorttype: sorttype))
      page = Nokogiri::HTML.parse(@session.html)
      page.css("#music_table1 td.music_jkimg a").map(&:text).map(&:strip)
    end

    private

    def music_url(page: nil, sorttype: nil)
      if page && !(page.is_a? Integer)
        raise ArgumentError, "page: `#{page}` is expected to be Integer"
      end

      if sorttype && ! valid_sorttypes.include?(sorttype.to_s)
        raise ArgumentError, "sorttype: `#{sorttype}' is expected to be #{valid_sorttypes.join(' or ')}"
      end

      URI.parse(MUSIC_INDEX).tap do |u|
        u.query = "page=#{page}" if page
      end
    end

    def valid_sorttypes
      %w(music_name basic medium hard special)
    end
  end
end
