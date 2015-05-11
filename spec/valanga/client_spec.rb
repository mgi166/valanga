
RSpec.describe Valanga::Client do
  describe '#login' do
    let(:client) { Valanga::Client.new }

    context 'when loggin successful' do
      it do
        expect(
          client.login(ENV['KID'], ENV['K_PASSWORD'])
        ).to be true
      end
    end

    context 'when loggin failed' do
      it do
        expect do
          client.login("hoge", "password")
        end.to raise_error RuntimeError
      end
    end
  end
end
