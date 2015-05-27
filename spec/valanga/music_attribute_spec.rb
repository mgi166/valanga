RSpec.describe Valanga::MusicAttribute do
  describe '#has_special?' do
    subject { Valanga::MusicAttribute.new(doc).has_special? }

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
