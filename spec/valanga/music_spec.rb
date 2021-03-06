RSpec.describe Valanga::Music do
  describe '.new' do
    subject { Valanga::Music.new(doc) }

    context 'when music is found' do
      let(:doc) { document('Arousing') }

      it { is_expected.to be_instance_of Valanga::Music }
    end

    context 'when music is not found' do
      let(:doc) { document('not_found_music') }

      it do
        expect do
          subject
        end.to raise_error Valanga::NoMusicInformationError
      end
    end
  end

  describe '#basic' do
    let(:doc) { document('Arousing') }

    it do
      expect(
        Valanga::Music.new(doc).basic
      ).to be_instance_of Valanga::Difficulty::Basic
    end
  end

  describe '#medium' do
    let(:doc) { document('Arousing') }

    it do
      expect(
        Valanga::Music.new(doc).medium
      ).to be_instance_of Valanga::Difficulty::Medium
    end
  end

  describe '#hard' do
    let(:doc) { document('Arousing') }

    it do
      expect(
        Valanga::Music.new(doc).hard
      ).to be_instance_of Valanga::Difficulty::Hard
    end
  end

  describe '#special' do
    let(:doc) { document('Arousing') }

    it do
      expect(
        Valanga::Music.new(doc).special
      ).to be_instance_of Valanga::Difficulty::Special
    end
  end

  describe '#collete' do
    let(:doc) { document('Arousing') }

    it do
      expect(
        Valanga::Music.new(doc).collete
      ).to be_instance_of Valanga::Music::Collete
    end
  end

  describe '#groovin' do
    let(:doc) { document('Arousing') }

    it do
      expect(
        Valanga::Music.new(doc).groovin
      ).to be_instance_of Valanga::Music::Groovin
    end
  end

  describe '#has_special?' do
    subject { Valanga::Music.new(doc).has_special? }

    context 'when music has a special' do
      let(:doc) { document('Anisakis') }
      it { is_expected.to be true }
    end

    context 'when music has no special' do
      let(:doc) { document('Arousing') }
      it { is_expected.to be false }
    end
  end
end
