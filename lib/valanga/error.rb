module Valanga
  class Error < ::StandardError; end

  class LoginError < Error; end
  class NoMusicInformationError < Error; end
  class NotFoundMusicTable < Error; end
end
