RSpec.describe Valanga::Music::Groovin do
  describe '#basic' do
    subject { Valanga::Music::Groovin.new(attribute).basic }

    context 'Arousing' do
      let(:attribute) { Valanga::Music.new(document('Arousing')) }

      it { is_expected.to be_instance_of Valanga::MusicAttribute }
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
