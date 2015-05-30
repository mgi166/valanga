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

  describe '#achievement_rate' do
    subject { Valanga::Difficulty::Basic.new(music).achievement_rate }

    it { is_expected.to eq 91.9 }
  end

  describe '#miss_count' do
    subject { Valanga::Difficulty::Basic.new(music).miss_count }

    it { is_expected.to eq 0 }
  end

  describe '#play_count' do
    subject { Valanga::Difficulty::Basic.new(music).play_count }

    it { is_expected.to be 1 }
  end
end
