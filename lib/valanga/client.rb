require 'mechanize'

module Valanga
  class Client
    LOGIN_PAGE = "https://p.eagate.573.jp/gate/p/login.html"

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
    end
  end
end
