require 'factory_girl_rails'
require 'support/factory_girl'
require 'database_cleaner'
require 'support/api_schema_matcher'
require 'pry'
FactoryGirl.find_definitions
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
      config.before :each do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.start
    end

    config.after do
      DatabaseCleaner.clean
    end
  end
end
