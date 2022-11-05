# frozen_string_literal: true

RSpec.describe(ShipEngine::Constants) do
  it "should contain Constants" do
    expect(ShipEngine::Constants::API_KEY).to(be_truthy)
    expect(ShipEngine::Constants::PROD_URL).to(be("https://api.shipengine.com"))
    expect(ShipEngine::Constants::PATHS.v1.addresses.validate_address).to(be("/v1/addresses/validate"))
    expect(ShipEngine::Constants::RETRIES).to(be(1))
    expect(ShipEngine::Constants::TIMEOUT).to(be(30_000))
    expect(ShipEngine::Constants::PAGE_SIZE).to(be(50))
  end
end
