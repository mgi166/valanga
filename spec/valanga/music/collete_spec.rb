RSpec.describe Valanga::Music::Collete do
  describe '#basic' do
    subject { Valanga::Music::Collete.new(attribute).basic }

    context 'Arousing' do
      let(:attribute) { Valanga::Music.new(document('Arousing')) }

      it do
        is_expected.to eq(
          {
            "rank"             => "/game/reflec/groovin/p/images/music/rank/syousai_4.png",
            "score"            => "378",
            "achievement_rate" => "91.9%",
            "miss_count"       => "0",
            "play_count"       => "1",
          }
        )
      end
    end

    context 'Anisakis' do
      let(:attribute) { Valanga::Music.new(document('Anisakis')) }

      it do
        is_expected.to eq(
          {
            "rank"             => "/game/reflec/groovin/p/images/music/rank/syousai_5.png",
            "score"            => "787",
            "achievement_rate" => "98.6%",
            "miss_count"       => "0",
            "play_count"       => "1",
          }
        )
      end
    end
  end

  describe '#medium' do
    subject { Valanga::Music::Collete.new(attribute).medium }

    context 'Arousing' do
      let(:attribute) { Valanga::Music.new(document('Arousing')) }

      it do
        is_expected.to eq(
          {
            "rank"             => "/game/reflec/groovin/p/images/music/rank/syousai_5.png",
            "score"            => "939",
            "achievement_rate" => "96.1%",
            "miss_count"       => "0",
            "play_count"       => "3",
          }
        )
      end
    end

    context 'Anisakis' do
      let(:attribute) { Valanga::Music.new(document('Anisakis')) }

      it do
        is_expected.to eq(
          {
            "rank"             => "/game/reflec/groovin/p/images/music/rank/syousai_4.png",
            "score"            => "1331",
            "achievement_rate" => "93.9%",
            "miss_count"       => "0",
            "play_count"       => "2",
          }
        )
      end
    end
  end

  describe '#hard' do
    subject { Valanga::Music::Collete.new(attribute).hard }

    context 'Arousing' do
      let(:attribute) { Valanga::Music.new(document('Arousing')) }

      it do
        is_expected.to eq(
          {
            "rank"             => "/game/reflec/groovin/p/images/music/rank/syousai_5.png",
            "score"            => "1611",
            "achievement_rate" => "98.1%",
            "miss_count"       => "0",
            "play_count"       => "46",
          }
        )
      end
    end

    context 'Anisakis' do
      let(:attribute) { Valanga::Music.new(document('Anisakis')) }

      it do
        is_expected.to eq(
          {
            "rank"             => "/game/reflec/groovin/p/images/music/rank/syousai_4.png",
            "score"            => "2077",
            "achievement_rate" => "93.0%",
            "miss_count"       => "1",
            "play_count"       => "50",
          }
        )
      end
    end
  end
end
