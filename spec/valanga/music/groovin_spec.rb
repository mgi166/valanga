RSpec.describe Valanga::Music::Groovin do
  describe '#basic' do
    subject { Valanga::Music::Groovin.new(attribute).basic }

    context 'Arousing' do
      let(:attribute) { Valanga::Music.new(document('Arousing')) }

      it { is_expected.to be_instance_of Valanga::MusicAttribute }

      it 'name is `Arousing`' do
        expect(subject.name).to eq 'Arousing'
      end

      it 'artist is `DJ TOTTO feat.吉河順央`' do
        expect(subject.artist).to eq 'DJ TOTTO feat.吉河順央'
      end
    end
  end

  describe '#medium' do
    subject { Valanga::Music::Groovin.new(attribute).medium }

    context 'Arousing' do
      let(:attribute) { Valanga::Music.new(document('Arousing')) }

      it { is_expected.to be_instance_of Valanga::MusicAttribute }
    end
  end

  describe '#hard' do
    subject { Valanga::Music::Groovin.new(attribute).hard }

    context 'Arousing' do
      let(:attribute) { Valanga::Music.new(document('Arousing')) }

      it { is_expected.to be_instance_of Valanga::MusicAttribute }
    end

    context 'Anisakis' do
      let(:attribute) { Valanga::Music.new(document('Anisakis')) }

      it { is_expected.to be_instance_of Valanga::MusicAttribute }
    end
  end

  describe '#special' do
    subject { Valanga::Music::Groovin.new(attribute).special }

    context 'Arousing' do
      let(:attribute) { Valanga::Music.new(document('Arousing')) }

      it { is_expected.to be_instance_of Valanga::MusicAttribute }
    end

    context 'Anisakis' do
      let(:attribute) { Valanga::Music.new(document('Anisakis')) }

      it { is_expected.to be_instance_of Valanga::MusicAttribute }
    end
  end
end
