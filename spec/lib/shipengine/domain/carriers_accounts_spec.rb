# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::CarriersAccounts) do
  let(:carriers_accounts) { ShipEngine::Domain::CarriersAccounts.new }

  context "Connect a carrier account" do
    it "should connect a carrier account" do
      params = {
        nickname: "Stamps.com",
        username: "username",
        password: "password",
      }

      expected_response = {
        carrier_id: "se-28529731",
      }

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.carriers_accounts.root}/#{ShipEngine::Enums::CarrierNames::STAMPS_COM}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = carriers_accounts.connect_carrier_account(
        carrier_name: ShipEngine::Enums::CarrierNames::STAMPS_COM,
        params: params
      )

      assert_requested(request, times: 1)

      expect(response.carrier_id).to(eq(expected_response[:carrier_id]))
    end
  end

  context "Disconnect a carrier" do
    it "should Disconnect a carrier" do
      carrier_id = "se-28529731"
      params = {}
      expected_response = {}

      request = stub_request(
        :delete,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.carriers_accounts.root}/#{ShipEngine::Enums::CarrierNames::STAMPS_COM}/#{carrier_id}"
      ).with(body: params).to_return(status: 204)

      response = carriers_accounts.disconnect_carrier_account(
        carrier_name: ShipEngine::Enums::CarrierNames::STAMPS_COM,
        carrier_id: carrier_id,
        params: params
      )

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end

  context "Get carrier settings" do
    it "should get carrier settings" do
      carrier_id = "se-28529731"
      params = {}
      expected_response = {
        nickname: "nickname",
        should_hide_account_number_on_archive_doc: true,
        is_primary_account: true,
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.carriers_accounts.root}/#{ShipEngine::Enums::CarrierNames::STAMPS_COM}/#{carrier_id}/settings"
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

      response = carriers_accounts.carrier_settings(
        carrier_name: ShipEngine::Enums::CarrierNames::STAMPS_COM,
        carrier_id: carrier_id,
        params: params
      )

      assert_requested(request, times: 1)

      expect(response.nickname).to(eq(expected_response[:nickname]))
      expect(response.should_hide_account_number_on_archive_doc).to(eq(expected_response[:should_hide_account_number_on_archive_doc]))
      expect(response.is_primary_account).to(eq(expected_response[:is_primary_account]))
    end
  end

  context "Update carrier settings" do
    it "should update carrier settings" do
      carrier_id = "se-28529731"
      params = {
        nickname: "nickname",
        should_hide_account_number_on_archive_doc: true,
        is_primary_account: true,
      }
      expected_response = {}

      request = stub_request(
        :put,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.carriers_accounts.root}/#{ShipEngine::Enums::CarrierNames::STAMPS_COM}/#{carrier_id}/settings"
      ).with(body: params).to_return(status: 204)

      response = carriers_accounts.update_carrier_settings(
        carrier_name: ShipEngine::Enums::CarrierNames::STAMPS_COM,
        carrier_id: carrier_id,
        params: params
      )

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end
end
