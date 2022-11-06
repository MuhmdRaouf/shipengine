# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::Batches) do
  let(:batches) { ShipEngine::Domain::Batches.new }

  context "List batches" do
    it "should list batches" do
      params = {}

      expected_response = {
        batches: [
          {
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
          },
        ],
        total: 10,
        page: 1,
        pages: 10,
        links: {
          first: {
            href: "https://api.shipengine.com/v1/labels/se-28529731",
            type: "string",
          },
          last: {
            href: "https://api.shipengine.com/v1/labels/se-28529731",
            type: "string",
          },
          prev: {
            href: "https://api.shipengine.com/v1/labels/se-28529731",
            type: "string",
          },
          next: {
            href: "https://api.shipengine.com/v1/labels/se-28529731",
            type: "string",
          },
        },
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.batches.path}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = batches.list_batches(params: params)

      assert_requested(request, times: 1)

      expect(response.batches.count).to(eq(expected_response[:batches].count))
      expect(response.total).to(eq(expected_response[:total]))
      expect(response.page).to(eq(expected_response[:page]))
      expect(response.pages).to(eq(expected_response[:pages]))
      expect(response.links["first"]["href"]).to(eq(expected_response[:links][:first][:href]))
      expect(response.links["last"]["href"]).to(eq(expected_response[:links][:last][:href]))
      expect(response.links["prev"]["href"]).to(eq(expected_response[:links][:prev][:href]))
      expect(response.links["next"]["href"]).to(eq(expected_response[:links][:next][:href]))
    end
  end

  context "Create a batch" do
    it "should create batches" do
      params = {
        external_batch_id: "se-28529731",
        batch_notes: "This is my batch",
        shipment_ids: ["se-28529731"],
        rate_ids: ["se-28529731"],
      }

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
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.batches.path}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = batches.create_batch(params: params)

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

  context "Batch By External ID" do
    it "should get batch by external batch id" do
      external_batch_id = "se-28529731"
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
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.batches.get_batch_by_external_id}/#{external_batch_id}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = batches.batch_by_external_id(external_batch_id: external_batch_id)

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

  context "Delete Batch By ID" do
    it "should delete batch by batch id" do
      batch_id = "se-28529731"
      params = {}
      expected_response = {}

      request = stub_request(
        :delete,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.batches.path}/#{batch_id}"
      ).with(body: params).to_return(status: 204)

      response = batches.delete_batch_by_id(batch_id: batch_id)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end

  context "Get Batch By ID" do
    it "should get batch by batch id" do
      batch_id = "se-28529731"
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
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.batches.path}/#{batch_id}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = batches.batch_by_id(batch_id: batch_id)

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

  context "Update Batch By ID" do
    it "should update batch by id by batch id" do
      batch_id = "se-28529731"
      params = {}
      expected_response = {}

      request = stub_request(
        :put,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.batches.path}/#{batch_id}"
      ).with(body: params).to_return(status: 204)

      response = batches.update_batch_by_id(batch_id: batch_id)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end

  context "Add to a Batch" do
    it "should add to a batch by batch id" do
      batch_id = "se-28529731"
      params = {
        shipment_ids: ["se-28529731"],
        rate_ids: ["se-28529731"],
      }
      expected_response = {}

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.batches.path}/#{batch_id}/add"
      ).with(body: params).to_return(status: 204)

      response = batches.add_to_batch(batch_id: batch_id, params: params)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end

  context "Get Batch Errors" do
    it "should get batch errors by batch id" do
      batch_id = "se-28529731"
      params = {}
      expected_response = {
        errors: [],
        links: {
          first: {},
          last: {},
          prev: {},
          next: {},
        },
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.batches.path}/#{batch_id}/errors"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = batches.batch_errors(batch_id: batch_id)

      assert_requested(request, times: 1)

      expect(response.errors.count).to(eq(expected_response[:errors].count))
      expect(response.links["first"]).to(eq(expected_response[:links][:first]))
      expect(response.links["last"]).to(eq(expected_response[:links][:last]))
      expect(response.links["prev"]).to(eq(expected_response[:links][:prev]))
      expect(response.links["next"]).to(eq(expected_response[:links][:next]))
    end
  end

  context "Process Batch ID Labels" do
    it "should process batch id labels by batch id" do
      batch_id = "se-28529731"
      params = {
        ship_date: "2018-09-23T15:00:00.000Z",
        label_layout: "4x6",
        label_format: "pdf",
        display_scheme: "label",
      }
      expected_response = {}

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.batches.path}/#{batch_id}/process/labels"
      ).with(body: params).to_return(status: 204)

      response = batches.process_batch_id_labels(batch_id: batch_id, params: params)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end

  context "Remove From Batch" do
    it "should remove from batch by batch id" do
      batch_id = "se-28529731"
      params = {
        shipment_ids: ["se-28529731"],
        rate_ids: ["se-28529731"],
      }
      expected_response = {}

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.batches.path}/#{batch_id}/remove"
      ).with(body: params).to_return(status: 204)

      response = batches.remove_from_batch(batch_id: batch_id, params: params)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end
end
