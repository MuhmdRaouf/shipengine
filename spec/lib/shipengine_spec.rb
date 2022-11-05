# frozen_string_literal: true

RSpec.describe(ShipEngine) do
  it "should contain default configured" do
    expect(ShipEngine.configs.api_key).to(eq(ShipEngine::Constants::API_KEY))
    expect(ShipEngine.configs.base_url).to(eq(ShipEngine::Constants::PROD_URL))
    expect(ShipEngine.configs.retries).to(eq(ShipEngine::Constants::RETRIES))
    expect(ShipEngine.configs.timeout).to(eq(ShipEngine::Constants::TIMEOUT))
    expect(ShipEngine.configs.page_size).to(eq(ShipEngine::Constants::PAGE_SIZE))
  end

  it "should configured via config block" do
    api_key = "test-api-key"

    ShipEngine.configure { |config| config.api_key = api_key }

    expect(ShipEngine.configs.api_key).to(eq(api_key))
    expect(ShipEngine.configs.base_url).to(eq(ShipEngine::Constants::PROD_URL))
    expect(ShipEngine.configs.retries).to(eq(ShipEngine::Constants::RETRIES))
    expect(ShipEngine.configs.timeout).to(eq(ShipEngine::Constants::TIMEOUT))
    expect(ShipEngine.configs.page_size).to(eq(ShipEngine::Constants::PAGE_SIZE))
  end
end
