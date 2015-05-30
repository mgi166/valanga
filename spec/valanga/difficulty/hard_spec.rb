RSpec.describe Valanga::Difficulty::Hard do
  let(:music) { Valanga::Music.new(document('Arousing')) }

  describe '#difficulty' do
    subject { Valanga::Difficulty::Hard.new(music).difficulty }

    it { is_expected.to eq 'HARD' }
  end

  describe '#rank' do
    subject { Valanga::Difficulty::Hard.new(music).rank }

    it { is_expected.to eq 'AAA+' }
  end

  describe '#score' do
    subject { Valanga::Difficulty::Hard.new(music).score }

    it { is_expected.to be 1615 }
  end

  describe '#achievement_rate' do
    subject { Valanga::Difficulty::Hard.new(music).achievement_rate }

    it { is_expected.to eq 98.4 }
  end

  describe '#miss_count' do
    subject { Valanga::Difficulty::Hard.new(music).miss_count }

    it { is_expected.to eq 0 }
  end

  describe '#play_count' do
    subject { Valanga::Difficulty::Hard.new(music).play_count }

    it { is_expected.to be 46 }
  end

  describe '#clear' do
    subject { Valanga::Difficulty::Hard.new(music).clear }

    it { is_expected.to eq 'clear' }
  end

  describe '#full_combo' do
    subject { Valanga::Difficulty::Hard.new(music).full_combo }

    it { is_expected.to eq 'all_just_reflec_full_combo' }
  end
end
