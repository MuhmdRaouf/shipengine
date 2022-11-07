# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::Tokens) do
  let(:tokens) { ShipEngine::Domain::Tokens.new }

  context "Get Ephemeral Token" do
    it "should get ephemeral token" do
      params = {
        redirect: "shipengine-dashboard",
      }
      expected_response = {
        token: "string",
        redirect_url: "shipengine-dashboard",
      }

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.tokens.root}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = tokens.ephemeral_token(params: params)

      assert_requested(request, times: 1)

      expect(response.token).to(eq(expected_response[:token]))
      expect(response.redirect_url).to(eq(expected_response[:redirect_url]))
    end
  end
end
