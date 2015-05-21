require 'capybara'
require 'capybara/poltergeist'

module Valanga
  class Client
    LOGIN_PAGE  = "https://p.eagate.573.jp/gate/p/login.html"
    MUSIC_INDEX = "https://p.eagate.573.jp/game/reflec/groovin/p/music/index.html"

    attr_reader :session

    def initialize(username, password)
      Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(app)
      end

      @session = Capybara::Session.new(:poltergeist)

      login!(username, password)
    end

    private

    def login!(username, password)
      @session.visit LOGIN_PAGE

      @session.fill_in 'KID', with: username
      @session.fill_in 'pass', with: password

      @session.click_on "規約に同意してログイン"

      unless @session.current_path == "/gate/p/mypage/index.html"
        raise LoginError, session.find(:xpath, '//div[@class="error_text_box"]/p').text
      end
    end
  end
end
