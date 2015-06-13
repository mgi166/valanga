module Valanga
  module MusicSearch
    MUSIC_INDEX = "http://p.eagate.573.jp/game/reflec/groovin/p/music/index.html"

    def list_musics(page: nil, sorttype: nil, sort: nil)
      musics = []

      page_sessions do |session|
        html = Nokogiri::HTML.parse(session.html)
        musics << html.css("#music_table1 td.music_jkimg a").map(&:text).map(&:strip)
      end

      musics.flatten
    end

    def musics_at(page: nil, sorttype: nil, sort: nil)
      [].tap do |result|
        session.visit(music_url(page: page, sorttype: sorttype, sort: sort))
        html = Nokogiri::HTML.parse(session.html)
        result << html.css("#music_table1 td.music_jkimg a").map(&:text).map(&:strip)
      end.flatten
    end

    def search(music_name)
      if music_id = music_ids[music_name]
        return create_music(music_id)
      end

      page_sessions do |session|
        begin
          session.within("#music_table1") do
            session.click_link(music_name)
          end

          music_ids[music_name] = music_id(session)

          return create_music(music_ids[music_name])
        rescue Capybara::ElementNotFound
          # if link is not found, go next page.
        end
      end
    end
    alias_method :[], :search
    alias_method :find_music, :search

    def music_image_url(music_name)
      if music_id = music_ids[music_name]
        return image_url(music_id)
      end

      page_sessions do |session|
        begin
          session.within("#music_table1") do
            on_click = session.find_link(music_name)['onClick']
            music_id = $1 if on_click =~ /id=([\w%]+)/
            music_ids[music_name] = music_id
            return image_url(music_id)
          end
        rescue Capybara::ElementNotFound
          # if link is not found, go next page.
        end
      end
    end

    private

    def create_music(music_id)
      info = info_url(music_id)
      session.visit(info)
      Music.new(session.html)
    end

    def page_sessions(&block)
      page = 1

      while page < 20 do
        session.visit(music_url(page: page))

        begin
          session.find("#music_table1")
        rescue Capybara::ElementNotFound
          break
        end

        yield session

        page += 1
      end
    end

    def image_url(music_id)
      "http://p.eagate.573.jp/game/reflec/groovin/p/images/binary.html?img=#{music_id}"
    end

    def info_url(music_id)
      "http://p.eagate.573.jp/game/reflec/groovin/p/music/m_info.html?id=#{music_id}"
    end

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
        u.query = {
          page: page,
          sorttype: valid_sorttypes[sorttype.to_s],
          sort: valid_sorts[sort.to_s]
        }.map { |k, v| "#{k}=#{v}" }.join('&')
      end
    end

    def music_id(session)
      src = session.find(:css, "iframe")['src']
      src.to_s.split('=').last
    end

    def valid_sorttypes
      { "music_name" => 0, "basic" => 1, "medium" => 2, "hard" => 3, "special" => 4 }
    end

    def valid_sorts
      { "asc" => 0, "desc" => 1 }
    end
  end
end
