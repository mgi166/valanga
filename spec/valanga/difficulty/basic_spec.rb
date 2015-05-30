RSpec.describe Valanga::Difficulty::Basic do
  let(:music) { Valanga::Music.new(document('Arousing')) }

  describe '#difficulty' do
    subject { Valanga::Difficulty::Basic.new(music).difficulty }

    it { is_expected.to eq 'BASIC' }
  end

  describe '#rank' do
    subject { Valanga::Difficulty::Basic.new(music).rank }

    it { is_expected.to eq 'AAA' }
  end

  describe '#score' do
    subject { Valanga::Difficulty::Basic.new(music).score }

    it { is_expected.to be 378 }
  end
end
