# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::Webhooks) do
  let(:webhooks) { ShipEngine::Domain::Webhooks.new }

  context "List Webhooks" do
    it "should list webhooks" do
      params = {}
      expected_response = [
        {
          webhook_id: "se-28529731",
          url: "https://[YOUR ENDPOINT ID].x.requestbin.com",
          event: "batch",
        },
      ]

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.webhooks.root}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = webhooks.list_webhooks

      assert_requested(request, times: 1)

      expect(response[0].webhook_id).to(eq(expected_response[0][:webhook_id]))
      expect(response[0].url).to(eq(expected_response[0][:url]))
      expect(response[0].event).to(eq(expected_response[0][:event]))
    end
  end

  context "Create Webhook" do
    it "should create webhook" do
      params = {
        event: "batch",
        url: "https://[YOUR ENDPOINT ID].x.requestbin.com",
      }
      expected_response = {
        webhook_id: "se-28529731",
        url: "https://[YOUR ENDPOINT ID].x.requestbin.com",
        event: "batch",
      }

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.webhooks.root}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = webhooks.create_webhook(params: params)

      assert_requested(request, times: 1)

      expect(response.webhook_id).to(eq(expected_response[:webhook_id]))
      expect(response.url).to(eq(expected_response[:url]))
      expect(response.event).to(eq(expected_response[:event]))
    end
  end

  context "Get Webhook By Id" do
    it "should get webhook by id" do
      webhook_id = "se-28529731"
      params = {}
      expected_response = {
        webhook_id: "se-28529731",
        url: "https://[YOUR ENDPOINT ID].x.requestbin.com",
        event: "batch",
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.webhooks.root}/#{webhook_id}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = webhooks.webhook_by_id(webhook_id: webhook_id, params: params)

      assert_requested(request, times: 1)

      expect(response.webhook_id).to(eq(expected_response[:webhook_id]))
      expect(response.url).to(eq(expected_response[:url]))
      expect(response.event).to(eq(expected_response[:event]))
    end
  end

  context "Update Webhook By Id" do
    it "should update webhook by id" do
      webhook_id = "se-28529731"
      params = {
        url: "https://[YOUR ENDPOINT ID].x.requestbin.com",
      }
      expected_response = {}

      request = stub_request(
        :put,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.webhooks.root}/#{webhook_id}"
      ).with(body: params).to_return(status: 204, body: expected_response.to_json)

      response = webhooks.update_webhook_by_id(webhook_id: webhook_id, params: params)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end

  context "Delete Webhook By Id" do
    it "should get webhook by id" do
      webhook_id = "se-28529731"
      params = {}
      expected_response = {}

      request = stub_request(
        :delete,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.webhooks.root}/#{webhook_id}"
      ).with(body: params).to_return(status: 204, body: expected_response.to_json)

      response = webhooks.delete_webhook_by_id(webhook_id: webhook_id, params: params)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end
end
