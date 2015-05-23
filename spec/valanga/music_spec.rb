RSpec.describe Valanga::Music do
  let(:music)   { Valanga::Music.new(session) }
  let(:session) { Valanga::Client.new(ENV['KID'], ENV['K_PASSWORD']).session }

  describe '#list_musics' do
    context 'with valid parameter' do
      it do
        expect do
          music.list_musics
        end.not_to raise_error
      end
    end

    context 'with invalid parameter' do
      it do
        expect do
          music.list_musics(page: "aaa")
        end.to raise_error ArgumentError
      end
    end
  end
end