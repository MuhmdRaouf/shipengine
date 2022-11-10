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
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

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
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

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

  context "Process Webhook" do
    it "should process_webhook and return batch" do
      hook_body = {
        resource_url: "https://api.shipengine.com/v1/batches/se-1013119",
        resource_type: "API_BATCH"
      }
      params = {}
      expected_response = {
        label_layout: "4x6",
        label_format: "pdf",
        batch_id: "se-28529731",
        batch_number: "string",
        external_batch_id: "string",
        batch_notes: "Batch for morning shipment",
        created_at: "2018-09-23T15:00:00.000Z",
        processed_at: "2018-09-23T15:00:00.000Z",
        errors: 2,
        warnings: 1,
        completed: 1,
        forms: 3,
        count: 2,
        batch_shipments_url: {
          href: "https://api.shipengine.com/v1/labels/se-28529731",
          type: "string",
        },
        batch_labels_url: {
          href: "https://api.shipengine.com/v1/labels/se-28529731",
          type: "string",
        },
        batch_errors_url: {
          href: "https://api.shipengine.com/v1/labels/se-28529731",
          type: "string",
        },
        label_download: {
          href: "https://api.shipengine.com/v1/labels/se-28529731",
          pdf: "https://api.shipengine.com/v1/labels/se-28529731",
          png: "https://api.shipengine.com/v1/labels/se-28529731",
          zpl: "https://api.shipengine.com/v1/labels/se-28529731",
        },
        form_download: {
          href: "https://api.shipengine.com/v1/labels/se-28529731",
          type: "string",
        },
        status: "open",
      }

      request = stub_request(
        :get,
        hook_body[:resource_url]
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

      response = webhooks.process_webhook(resource_url: hook_body[:resource_url])

      assert_requested(request, times: 1)

      expect(response.label_layout).to(eq(expected_response[:label_layout]))
      expect(response.label_format).to(eq(expected_response[:label_format]))
      expect(response.batch_id).to(eq(expected_response[:batch_id]))
      expect(response.batch_number).to(eq(expected_response[:batch_number]))
      expect(response.external_batch_id).to(eq(expected_response[:external_batch_id]))
      expect(response.batch_notes).to(eq(expected_response[:batch_notes]))
      expect(response.created_at).to(eq(expected_response[:created_at]))
      expect(response.processed_at).to(eq(expected_response[:processed_at]))
      expect(response.errors).to(eq(expected_response[:errors]))
      expect(response.warnings).to(eq(expected_response[:warnings]))
      expect(response.completed).to(eq(expected_response[:completed]))
      expect(response.forms).to(eq(expected_response[:forms]))
      expect(response["count"]).to(eq(expected_response[:count]))
      expect(response.batch_shipments_url["href"]).to(eq(expected_response[:batch_shipments_url][:href]))
      expect(response.batch_labels_url["href"]).to(eq(expected_response[:batch_labels_url][:href]))
      expect(response.batch_errors_url["href"]).to(eq(expected_response[:batch_errors_url][:href]))
      expect(response.label_download["href"]).to(eq(expected_response[:label_download][:href]))
      expect(response.form_download["href"]).to(eq(expected_response[:form_download][:href]))
      expect(response.status).to(eq(expected_response[:status]))
    end
  end
end
