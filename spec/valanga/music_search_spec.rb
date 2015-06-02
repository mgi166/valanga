RSpec.describe Valanga::MusicSearch do
  # NOTE: Spec is too slow, so caches the capybara session.
  before(:all) do
    @music_searcher = Class.new do
      include Valanga::MusicSearch
      attr_accessor :session
      def session
        @session ||= Valanga::Client.new(ENV['KID'], ENV['K_PASSWORD']).session
      end
    end.new
  end

  describe '#list_musics' do
    context 'with valid parameters' do
      it do
        expect do
          @music_searcher.list_musics
        end.not_to raise_error
      end

      it do
        expect do
          @music_searcher.list_musics(page: 1)
        end.not_to raise_error
      end

      it do
        expect do
          @music_searcher.list_musics(sorttype: :music_name)
        end.not_to raise_error
      end

      it do
        expect do
          @music_searcher.list_musics(sort: :asc)
        end.not_to raise_error
      end

      context 'when page is over' do
        it do
          expect(
            @music_searcher.list_musics(page: 10000)
          ).to eq []
        end
      end
    end

    context 'with invalid parameters' do
      context 'given `page` is not integer' do
        it do
          expect do
            @music_searcher.list_musics(page: "aaa")
          end.to raise_error ArgumentError
        end
      end

      context 'given `sorttype` is not included in `music_name` or `basic` or ` medium` or `hard` or `special`' do
        it do
          expect do
            @music_searcher.list_musics(sorttype: "aaa")
          end.to raise_error ArgumentError
        end
      end

      context 'given `sort` is not included in `asc` or `desc`' do
        it do
          expect do
            @music_searcher.list_musics(sort: "aaa")
          end.to raise_error ArgumentError
        end
      end
    end
  end

  describe '#[]' do
    context 'when finds the music' do
      it do
        expect(
          @music_searcher['RPG']
        ).to be_instance_of Valanga::Music
      end
    end

    context 'when finds the music (page=2)' do
      it do
        expect(
          @music_searcher['鬼天']
        ).to be_instance_of Valanga::Music
      end
    end

    context 'when does not find the music' do
      it do
        expect(
          @music_searcher['muuuusic']
        ).to be nil
      end
    end
  end
end
