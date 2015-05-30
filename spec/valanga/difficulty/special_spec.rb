RSpec.describe Valanga::Difficulty::Special do
  let(:music) { Valanga::Music.new(document('Anisakis')) }

  describe '#difficulty' do
    subject { Valanga::Difficulty::Special.new(music).difficulty }

    it { is_expected.to eq 'SPECIAL' }
  end

  describe '#rank' do
    subject { Valanga::Difficulty::Special.new(music).rank }

    it { is_expected.to eq 'AA' }
  end

  describe '#score' do
    subject { Valanga::Difficulty::Special.new(music).score }

    it { is_expected.to be 2726 }
  end

  describe '#achievement_rate' do
    subject { Valanga::Difficulty::Special.new(music).achievement_rate }

    it { is_expected.to eq 88.5 }
  end

  describe '#miss_count' do
    subject { Valanga::Difficulty::Special.new(music).miss_count }

    it { is_expected.to eq 3 }
  end

  describe '#play_count' do
    subject { Valanga::Difficulty::Special.new(music).play_count }

    it { is_expected.to be 16 }
  end

  describe '#clear' do
    subject { Valanga::Difficulty::Special.new(music).clear }

    it { is_expected.to eq 'clear' }
  end

  describe '#full_combo' do
    subject { Valanga::Difficulty::Special.new(music).full_combo }

    it { is_expected.to be nil }
  end
end
