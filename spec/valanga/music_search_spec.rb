RSpec.describe Valanga::MusicSearch do
  # NOTE: Spec is too slow, so caches the capybara session.
  before(:all) do
    @music_searcher = Class.new do
      include Valanga::MusicSearch
      attr_accessor :session
      attr_reader :music_ids

      def initialize
        @music_ids = {}
      end

      def session
        @session ||= Valanga::Client.new.session
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

  describe '#search' do
    context 'when finds the music' do
      it do
        expect(
          @music_searcher.search('RPG')
        ).to be_instance_of Valanga::Music
      end
    end

    context 'when finds the music (page=2)' do
      it do
        expect(
          @music_searcher.search('鬼天')
        ).to be_instance_of Valanga::Music
      end
    end

    context 'when does not find the music' do
      it do
        expect(
          @music_searcher.search('muuuusic')
        ).to be nil
      end
    end
  end

  describe '#music_image_url' do
    context 'when finds the music' do
      it do
        expect(
          @music_searcher.music_image_url('愛は不死鳥の様に')
        ).to eq 'http://p.eagate.573.jp/game/reflec/groovin/p/images/binary.html?img=sXEPaas8apvqg8BnZ5drKuUHpNt%2FY1N6%2FlbAdjzBE6w%3D'
      end
    end

    context 'when finds the music (page=2)' do
      it do
        expect(
          @music_searcher.music_image_url('朧')
        ).to eq 'http://p.eagate.573.jp/game/reflec/groovin/p/images/binary.html?img=h1Qz2wJDnzV6GI1YiQFB5dXowq2lHWQYLgrIgHJX%2FxM%3D'
      end
    end
  end
end
