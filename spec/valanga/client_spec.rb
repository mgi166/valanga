RSpec.describe Valanga::Client do
  describe '#login' do
    let(:client) { Valanga::Client.new }

    context 'when loggin successful' do
      it do
        expect do
          client.login(ENV['KID'], ENV['K_PASSWORD'])
        end.not_to raise_error
      end
    end

    context 'when loggin failed' do
      it do
        expect do
          client.login("hoge", "password")
        end.to raise_error Valanga::LoginError
      end
    end
  end
end
