# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::Shipsurance) do
  let(:shipsurance) { ShipEngine::Domain::Shipsurance.new }

  context "Disconnect a Shipsurance Account" do
    it "should disconnect a shipsurance account" do
      params = {}
      expected_response = {}

      request = stub_request(
        :delete,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.shipsurance.root}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = shipsurance.disconnect_shipsurance_account

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end

  context "Connect a Shipsurance Account" do
    it "should connect a shipsurance account" do
      params = {
        email: "john.doe@example.com",
        policy_id: "policy_id",
      }
      expected_response = {}

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.shipsurance.root}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = shipsurance.connect_shipsurance_account(params: params)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end

  context "Add Funds To Insurance" do
    it "should add funds to insurance" do
      params = {
        currency: "USD",
        amount: 10,
      }
      expected_response = {
        currency: "USD",
        amount: 10,
      }

      request = stub_request(
        :patch,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.shipsurance.add_funds}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = shipsurance.add_funds_to_insurance(params: params)

      assert_requested(request, times: 1)

      expect(response.currency).to(eq(expected_response[:currency]))
      expect(response.amount).to(eq(expected_response[:amount]))
    end
  end

  context "Get Insurance Funds Balance" do
    it "should get insurance funds balance" do
      params = {}
      expected_response = {
        currency: "USD",
        amount: 10,
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.shipsurance.balance}"
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

      response = shipsurance.get_insurance_funds_balance(params: params)

      assert_requested(request, times: 1)

      expect(response.currency).to(eq(expected_response[:currency]))
      expect(response.amount).to(eq(expected_response[:amount]))
    end
  end
end
