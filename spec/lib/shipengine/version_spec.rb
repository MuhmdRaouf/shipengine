# frozen_string_literal: true

RSpec.describe(ShipEngine::VERSION) do
  it "should contain version number" do
    expect(ShipEngine::VERSION::VERSION).to(be("0.0.7"))
  end
end
