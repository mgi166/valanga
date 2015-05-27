RSpec.describe Valanga::MusicAttribute::Groovin do
  describe '#basic' do
    subject { Valanga::MusicAttribute::Groovin.new(attribute).basic }

    context 'Arousing' do
      let(:attribute) { Valanga::MusicAttribute.new(document('Arousing')) }

      it do
        is_expected.to eq(
          {
            'difficulty'       => 'BASIC',
            'rank'             => '-',
            'score'            => '-',
            'achievement_rate' => '-',
            'miss_count'       => '-',
            'play_count'       => '-',
            'clear'            => '-',
            'full_combo'       => '-',
          }
        )
      end
    end
  end

  describe '#medium' do
    subject { Valanga::MusicAttribute::Groovin.new(attribute).medium }

    context 'Arousing' do
      let(:attribute) { Valanga::MusicAttribute.new(document('Arousing')) }

      it do
        is_expected.to eq(
          {
            'difficulty'       => 'MEDIUM',
            'rank'             => '-',
            'score'            => '-',
            'achievement_rate' => '-',
            'miss_count'       => '-',
            'play_count'       => '-',
            'clear'            => '-',
            'full_combo'       => '-',
          }
        )
      end
    end
  end

  describe '#hard' do
    subject { Valanga::MusicAttribute::Groovin.new(attribute).hard }

    context 'Arousing' do
      let(:attribute) { Valanga::MusicAttribute.new(document('Arousing')) }

      it do
        is_expected.to eq(
          {
            'difficulty'       => 'HARD',
            'rank'             => 'AAA+',
            'score'            => '1615',
            'achievement_rate' => '98.4%',
            'miss_count'       => '0',
            'play_count'       => '20',
            'clear'            => 'clear',
            'full_combo'       => 'all_just_reflec_full_combo',
          }
        )
      end
    end

    context 'Anisakis' do
      let(:attribute) { Valanga::MusicAttribute.new(document('Anisakis')) }

      it do
        is_expected.to eq(
          {
            'difficulty'       => 'HARD',
            'rank'             => 'AAA',
            'score'            => '2069',
            'achievement_rate' => '93.9%',
            'miss_count'       => '4',
            'play_count'       => '10',
            'clear'            => 'hard_clear',
            'full_combo'       => '-',
          }
        )
      end
    end
  end

  describe '#special' do
    subject { Valanga::MusicAttribute::Groovin.new(attribute).special }

    context 'Arousing' do
      let(:attribute) { Valanga::MusicAttribute.new(document('Arousing')) }

      it { is_expected.to be nil }
    end

    context 'Anisakis' do
      let(:attribute) { Valanga::MusicAttribute.new(document('Anisakis')) }

      it do
        is_expected.to eq(
          {
            'difficulty'       => 'SPECIAL',
            'rank'             => 'AA',
            'score'            => '2726',
            'achievement_rate' => '88.5%',
            'miss_count'       => '3',
            'play_count'       => '16',
            'clear'            => 'clear',
            'full_combo'       => '-',
          }
        )
      end
    end
  end
end
