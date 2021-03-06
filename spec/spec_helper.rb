RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  require File.join(__dir__, '../lib/valanga')

  module FixturePathHelper
    def document(file_name)
      File.read(File.join(__dir__, 'fixtures', "#{file_name}.html"))
    end
  end

  config.include FixturePathHelper
end
