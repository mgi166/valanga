RSpec.describe Valanga::Music do
  let(:music)   { Valanga::Music.new(session) }
  let(:session) { Valanga::Client.new(ENV['KID'], ENV['K_PASSWORD']).session }

  describe '#list_musics' do
    context 'with valid parameters' do
      it do
        expect do
          music.list_musics
        end.not_to raise_error
      end

      it do
        expect do
          music.list_musics(page: 1)
        end.not_to raise_error
      end

      it do
        expect do
          music.list_musics(sorttype: :music_name)
        end.not_to raise_error
      end
    end

    context 'with invalid parameters' do
      context 'given `page` is not integer' do
        it do
          expect do
            music.list_musics(page: "aaa")
          end.to raise_error ArgumentError
        end
      end

      context 'given `sorttype` is not included in `music_name` or `basic` or ` medium` or `hard` or `special`' do
        it do
          expect do
            music.list_musics(sorttype: "aaa")
          end.to raise_error ArgumentError
        end
      end
    end
  end
end
