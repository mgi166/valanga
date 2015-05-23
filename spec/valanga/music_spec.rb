RSpec.describe Valanga::Music do
  let(:music)   { Valanga::Music.new(session) }
  let(:session) { Valanga::Client.new(ENV['KID'], ENV['K_PASSWORD']).session }

  describe '#list_musics' do
    it do
      music.list_musics
    end
  end
end
