RSpec.describe Valanga::Client do
  describe '#login' do
    context 'when loggin successful' do
      it do
        expect do
          Valanga::Client.new(ENV['KID'], ENV['K_PASSWORD'])
        end.not_to raise_error
      end
    end

    context 'when loggin failed' do
      it do
        expect do
          Valanga::Client.new("hoge", "password")
        end.to raise_error Valanga::LoginError, '※KONAMI ID、パスワードのいずれかが不正です。'
      end
    end
  end
end
