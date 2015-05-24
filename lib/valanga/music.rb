module Valanga
  class Music
    MUSIC_INDEX = "http://p.eagate.573.jp/game/reflec/groovin/p/music/index.html"

    def initialize(session)
      @session = session
    end

    def list_musics(page: nil, sorttype: nil, sort: nil)
      @session.visit(music_url(page: page, sorttype: sorttype, sort: sort))
      html = Nokogiri::HTML.parse(@session.html)
      html.css("#music_table1 td.music_jkimg a").map(&:text).map(&:strip)
    end

    private

    def music_url(page: nil, sorttype: nil, sort: nil)
      if page && !(page.is_a? Integer)
        raise ArgumentError, "page: `#{page}` is expected to be Integer"
      end

      if sorttype && ! valid_sorttypes.include?(sorttype.to_s)
        raise ArgumentError, "sorttype: `#{sorttype}' is expected to be #{valid_sorttypes.keys.join(' or ')}"
      end

      if sort && ! valid_sorts.include?(sort.to_s)
        raise ArgumentError, "sort: `#{sort}' is expected to be #{valid_sorts.keys.join(' or ')}"
      end

      URI.parse(MUSIC_INDEX).tap do |u|
        query = {
          page: page,
          sorttype: valid_sorttypes[sorttype.to_s],
          sort: valid_sorts[sort.to_s]
        }.map { |k, v| "#{k}=#{v}" if v }.compact.join('&')

        u.query = query unless query.empty?
      end
    end

    def valid_sorttypes
      { "music_name" => 0, "basic" => 1, "medium" => 2, "hard" => 3, "special" => 4 }
    end

    def valid_sorts
      { "asc" => 0, "desc" => 1 }
    end
  end
end
