RSpec.describe Valanga::MusicAttribute do
  describe '#rank' do
    subject { Valanga::MusicAttribute.new(attribute).rank }

    context 'not yet play' do
      let(:attribute) do
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
      end

      it { is_expected.to be nil }
    end

    context 'when played with rank `AAA+`' do
      let(:attribute) do
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
      end

      it { is_expected.to eq 'AAA+' }
    end
  end
end
