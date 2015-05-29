RSpec.describe Valanga::Music do
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
