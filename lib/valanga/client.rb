require 'mechanize'

module Valanga
  class Client
    LOGIN_PAGE = "https://p.eagate.573.jp/gate/p/login.html"
    MUSIC_INDEX = "http://p.eagate.573.jp/game/reflec/groovin/p/music/index.html"

    def initialize
      @mechanize = Mechanize.new do |mech|
        mech.keep_alive = false
      end
    end

    def login(username, password)
      @mechanize.get(LOGIN_PAGE) do |page|
        page.form_with do |f|
          f.encoding = 'Shift_JIS'
          f['KID']  = username
          f['pass'] = password
        end.submit
      end

      if logged_in?
        true
      else
        raise
      end
    end

    def logged_in?
      page = @mechanize.get(MUSIC_INDEX)
      ! page.links.find { |link| link.text =~ /ログイン/ }
    end
  end
end
