RSpec.describe Valanga::Music do
  describe '#list_musics' do
    # NOTE: Spec is too slow, so caches the capybara session.
    before(:all) do
      session = Valanga::Client.new(ENV['KID'], ENV['K_PASSWORD']).session
      @music = Valanga::Music.new(session)
    end

    context 'with valid parameters' do
      it do
        expect do
          @music.list_musics
        end.not_to raise_error
      end

      it do
        expect do
          @music.list_musics(page: 1)
        end.not_to raise_error
      end

      it do
        expect do
          @music.list_musics(sorttype: :music_name)
        end.not_to raise_error
      end
    end

    context 'with invalid parameters' do
      context 'given `page` is not integer' do
        it do
          expect do
            @music.list_musics(page: "aaa")
          end.to raise_error ArgumentError
        end
      end

      context 'given `sorttype` is not included in `music_name` or `basic` or ` medium` or `hard` or `special`' do
        it do
          expect do
            @music.list_musics(sorttype: "aaa")
          end.to raise_error ArgumentError
        end
      end

      context 'given `sort` is not included in `asc` or `desc`' do
        it do
          expect do
            @music.list_musics(sort: "aaa")
          end.to raise_error ArgumentError
        end
      end
    end
  end
end
