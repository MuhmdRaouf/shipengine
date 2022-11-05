# frozen_string_literal: true

RSpec.describe(ShipEngine) do
  it "should contain version number" do
    expect(ShipEngine::VERSION).to(be("0.0.1"))
  end
end
