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

  describe '#score' do
    subject { Valanga::MusicAttribute.new(attribute).score }

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

      it { is_expected.to be 0 }
    end

    context 'when played with score `1615`' do
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

      it { is_expected.to eq 1615 }
    end
  end

  describe '#achievement_rate' do
    subject { Valanga::MusicAttribute.new(attribute).achievement_rate }

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

      it { is_expected.to be 0.0 }
    end

    context 'when played with AR `98.4%`' do
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

      it { is_expected.to eq 98.4 }
    end
  end

  describe '#miss_count' do
    subject { Valanga::MusicAttribute.new(attribute).miss_count }

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

      it { is_expected.to be 0 }
    end

    context 'when played with miss_count `3`' do
      let(:attribute) do
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
      end

      it { is_expected.to be 3 }
    end
  end

  describe '#play_count' do
    subject { Valanga::MusicAttribute.new(attribute).play_count }

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

      it { is_expected.to be 0 }
    end

    context 'when played 20 times' do
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

      it { is_expected.to be 20 }
    end
  end

  describe '#clear' do
    subject { Valanga::MusicAttribute.new(attribute).clear }

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

      it { is_expected.to be nil  }
    end

    context 'when played with `clear`' do
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

      it { is_expected.to eq 'clear' }
    end
  end

  describe '#full_combo' do
    subject { Valanga::MusicAttribute.new(attribute).full_combo }

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

      it { is_expected.to eq nil }
    end

    context 'when played with `full_combo` and `all_just_reflec`' do
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

      it { is_expected.to eq 'all_just_reflec_full_combo' }
    end
  end
end
