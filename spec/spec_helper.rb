# frozen_string_literal: true

require "bundler/setup"
require "webmock/rspec"
require "shipengine"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.before(:each) do
    cleanup
  end

  config.expect_with(:rspec) do |c|
    c.syntax = :expect
  end

  private

  def cleanup
    ShipEngine.configure do |conf|
      conf.api_key = ShipEngine::Constants::API_KEY
      conf.base_url = ShipEngine::Constants::PROD_URL
      conf.retries = ShipEngine::Constants::RETRIES
      conf.timeout = ShipEngine::Constants::TIMEOUT
      conf.page_size = ShipEngine::Constants::PAGE_SIZE
    end
  end
end
