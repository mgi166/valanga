RSpec.describe Valanga::PlayList do
  describe '#music_ids' do
    let(:play_list) { Valanga::PlayList.new(doc) }
    let(:doc) { document("play_list") }

    it do
      expect(play_list.music_ids.size).to eq 20
    end
  end
end
