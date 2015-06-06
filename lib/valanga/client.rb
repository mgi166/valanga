require 'capybara'
require 'capybara/poltergeist'

module Valanga
  class Client
    include Valanga::MusicSearch

    LOGIN_PAGE  = "https://p.eagate.573.jp/gate/p/login.html"

    attr_reader :session, :pages

    def initialize(username, password)
      Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(app, js_errors: false)
      end

      @session = Capybara::Session.new(:poltergeist)
      @pages   = {}

      login!(username, password)
    end

    private

    def login!(username, password)
      @session.visit LOGIN_PAGE

      @session.fill_in 'KID', with: username
      @session.fill_in 'pass', with: password

      @session.click_on "規約に同意してログイン"

      unless @session.current_path == "/gate/p/mypage/index.html"
        raise LoginError, session.find(:css, 'div.error_text_box').text
      end
    end
  end
end
