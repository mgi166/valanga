RSpec.describe Valanga::Difficulty::Basic do
  describe '#rank' do
    subject { Valanga::Difficulty::Basic.new(music).rank }
    let(:music) { Valanga::Music.new(document('Arousing')) }

    it { is_expected.to eq 'AAA' }
  end
end
