RSpec.describe Valanga::Music::Groovin do
  describe '#basic' do
    subject { Valanga::Music::Groovin.new(attribute).basic }

    context 'Arousing' do
      let(:attribute) { Valanga::Music.new(document('Arousing')) }

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
    subject { Valanga::Music::Groovin.new(attribute).medium }

    context 'Arousing' do
      let(:attribute) { Valanga::Music.new(document('Arousing')) }

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
    subject { Valanga::Music::Groovin.new(attribute).hard }

    context 'Arousing' do
      let(:attribute) { Valanga::Music.new(document('Arousing')) }

      it do
        is_expected.to eq(
          {
            'difficulty'       => 'HARD',
            'rank'             => '/game/reflec/groovin/p/images/music/rank/syousai_5.png',
            'score'            => '1615',
            'achievement_rate' => '98.4%',
            'miss_count'       => '0',
            'play_count'       => '20',
            'clear'            => '../images/music/d_clear_typ_0.gif',
            'full_combo'       => '../images/music/fullcombo_img2.gif',
          }
        )
      end
    end

    context 'Anisakis' do
      let(:attribute) { Valanga::Music.new(document('Anisakis')) }

      it do
        is_expected.to eq(
          {
            'difficulty'       => 'HARD',
            'rank'             => '/game/reflec/groovin/p/images/music/rank/syousai_4.png',
            'score'            => '2069',
            'achievement_rate' => '93.9%',
            'miss_count'       => '4',
            'play_count'       => '10',
            'clear'            => '../images/music/d_clear_typ_1.gif',
            'full_combo'       => '-',
          }
        )
      end
    end
  end

  describe '#special' do
    subject { Valanga::Music::Groovin.new(attribute).special }

    context 'Arousing' do
      let(:attribute) { Valanga::Music.new(document('Arousing')) }

      it { is_expected.to be nil }
    end

    context 'Anisakis' do
      let(:attribute) { Valanga::Music.new(document('Anisakis')) }

      it do
        is_expected.to eq(
          {
            'difficulty'       => 'SPECIAL',
            'rank'             => '/game/reflec/groovin/p/images/music/rank/syousai_3.png',
            'score'            => '2726',
            'achievement_rate' => '88.5%',
            'miss_count'       => '3',
            'play_count'       => '16',
            'clear'            => '../images/music/d_clear_typ_0.gif',
            'full_combo'       => '-',
          }
        )
      end
    end
  end
end
