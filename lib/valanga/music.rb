module Valanga
  class Music
    MUSIC_INDEX = "https://p.eagate.573.jp/game/reflec/groovin/p/music/index.html"

    def initialize(session)
      @session = session
    end

    def list_musics(page: nil)
    end

    private

    def music_url(page: nil)
      URI.parse(MUSIC_INDEX).tap do |u|
        u.query = "page=#{page}" if page
      end
    end
  end
end
