RSpec.describe Valanga::Difficulty::Medium do
  let(:music) { Valanga::Music.new(document('Arousing')) }

  describe '#difficulty' do
    subject { Valanga::Difficulty::Medium.new(music).difficulty }

    it { is_expected.to eq 'MEDIUM' }
  end

  describe '#rank' do
    subject { Valanga::Difficulty::Medium.new(music).rank }

    it { is_expected.to eq 'AAA+' }
  end

  describe '#score' do
    subject { Valanga::Difficulty::Medium.new(music).score }

    it { is_expected.to be 939 }
  end

  describe '#achievement_rate' do
    subject { Valanga::Difficulty::Medium.new(music).achievement_rate }

    it { is_expected.to eq 96.1 }
  end

  describe '#miss_count' do
    subject { Valanga::Difficulty::Medium.new(music).miss_count }

    it { is_expected.to eq 0 }
  end

  describe '#play_count' do
    subject { Valanga::Difficulty::Medium.new(music).play_count }

    it { is_expected.to be 3 }
  end

  describe '#clear' do
    subject { Valanga::Difficulty::Medium.new(music).clear }

    it { is_expected.to eq 'clear' }
  end

  describe '#full_combo' do
    subject { Valanga::Difficulty::Medium.new(music).full_combo }

    it { is_expected.to eq 'full_combo' }
  end
end
