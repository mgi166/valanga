
RSpec.describe Valanga::Client do
  describe '#login' do
    it do
      v = Valanga::Client.new
      v.login(ENV['KID'], ENV['K_PASSWORD'])
    end
  end
end
