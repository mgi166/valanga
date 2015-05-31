RSpec.describe Valanga::Music::Collete do
  describe '#basic' do
    subject { Valanga::Music::Collete.new(attribute).basic }

    context 'Arousing' do
      let(:attribute) { Valanga::Music.new(document('Arousing')) }

      it { is_expected.to be_instance_of Valanga::MusicAttribute }
    end

    context 'Anisakis' do
      let(:attribute) { Valanga::Music.new(document('Anisakis')) }

      it { is_expected.to be_instance_of Valanga::MusicAttribute }
    end
  end

  describe '#medium' do
    subject { Valanga::Music::Collete.new(attribute).medium }

    context 'Arousing' do
      let(:attribute) { Valanga::Music.new(document('Arousing')) }

      it { is_expected.to be_instance_of Valanga::MusicAttribute }
    end

    context 'Anisakis' do
      let(:attribute) { Valanga::Music.new(document('Anisakis')) }

      it { is_expected.to be_instance_of Valanga::MusicAttribute }
    end
  end

  describe '#hard' do
    subject { Valanga::Music::Collete.new(attribute).hard }

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
