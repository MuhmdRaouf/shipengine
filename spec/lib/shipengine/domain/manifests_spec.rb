# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::Manifests) do
  let(:manifests) { ShipEngine::Domain::Manifests.new }

  context "List Manifests" do
    it "should list manifests" do
      params = {}
      expected_response = {
        manifests: [
          {
            manifest_id: "se-28529731",
            form_id: "se-28529731",
            created_at: "2019-07-12T13:37:39.050Z",
            ship_date: "2019-07-12T13:37:39.050Z",
            shipments: 100,
            label_ids: ["se-28529731"],
            warehouse_id: "se-28529731",
            submission_id: "9475711899564878915476",
            carrier_id: "se-28529731",
            manifest_download: {
              href: "httpss://api.shipengine.com/v1/labels/se-28529731",
            },
          },
        ],
        total: 3,
        page: 3,
        pages: 4,
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
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.manifests.root}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = manifests.list_manifests

      assert_requested(request, times: 1)

      expect(response.manifests[0].manifest_id).to(eq(expected_response[:manifests][0][:manifest_id]))
      expect(response.manifests[0].form_id).to(eq(expected_response[:manifests][0][:form_id]))
      expect(response.manifests[0].created_at).to(eq(expected_response[:manifests][0][:created_at]))
      expect(response.manifests[0].ship_date).to(eq(expected_response[:manifests][0][:ship_date]))
      expect(response.manifests[0].shipments).to(eq(expected_response[:manifests][0][:shipments]))
      expect(response.manifests[0].label_ids[0]).to(eq(expected_response[:manifests][0][:label_ids][0]))
      expect(response.manifests[0].warehouse_id).to(eq(expected_response[:manifests][0][:warehouse_id]))
      expect(response.manifests[0].submission_id).to(eq(expected_response[:manifests][0][:submission_id]))
      expect(response.manifests[0].carrier_id).to(eq(expected_response[:manifests][0][:carrier_id]))
      expect(response.manifests[0].manifest_download.href).to(eq(expected_response[:manifests][0][:manifest_download][:href]))

      expect(response.total).to(eq(expected_response[:total]))
      expect(response.page).to(eq(expected_response[:page]))
      expect(response.pages).to(eq(expected_response[:pages]))
      expect(response.links["first"]["href"]).to(eq(expected_response[:links][:first][:href]))
      expect(response.links["last"]["href"]).to(eq(expected_response[:links][:last][:href]))
      expect(response.links["prev"]["href"]).to(eq(expected_response[:links][:prev][:href]))
      expect(response.links["next"]["href"]).to(eq(expected_response[:links][:next][:href]))
    end
  end

  context "Create Manifests" do
    it "should create manifests" do
      params = {
        carrier_id: "se-28529731",
        excluded_label_ids: [
          "se-28529731",
        ],
        label_ids: [
          "se-28529731",
        ],
        warehouse_id: "se-28529731",
        ship_date: "2018-09-23T15:00:00.000Z",
      }
      expected_response = {
        manifests: [
          {
            manifest_id: "se-28529731",
            form_id: "se-28529731",
            created_at: "2019-07-12T13:37:39.050Z",
            ship_date: "2019-07-12T13:37:39.050Z",
            shipments: 100,
            label_ids: ["se-28529731"],
            warehouse_id: "se-28529731",
            submission_id: "9475711899564878915476",
            carrier_id: "se-28529731",
            manifest_download: {
              href: "httpss://api.shipengine.com/v1/labels/se-28529731",
            },
          },
        ],
        manifest_requests: [
          {
            manifest_request_id: "se-28529731",
            status: "in_progress",
          },
        ],
        request_id: "aa3d8e8e-462b-4476-9618-72db7f7b7009",
        errors: [],
      }

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.manifests.root}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = manifests.create_manifest(params: params)

      assert_requested(request, times: 1)

      expect(response.manifests[0].manifest_id).to(eq(expected_response[:manifests][0][:manifest_id]))
      expect(response.manifests[0].form_id).to(eq(expected_response[:manifests][0][:form_id]))
      expect(response.manifests[0].created_at).to(eq(expected_response[:manifests][0][:created_at]))
      expect(response.manifests[0].ship_date).to(eq(expected_response[:manifests][0][:ship_date]))
      expect(response.manifests[0].shipments).to(eq(expected_response[:manifests][0][:shipments]))
      expect(response.manifests[0].label_ids[0]).to(eq(expected_response[:manifests][0][:label_ids][0]))
      expect(response.manifests[0].warehouse_id).to(eq(expected_response[:manifests][0][:warehouse_id]))
      expect(response.manifests[0].submission_id).to(eq(expected_response[:manifests][0][:submission_id]))
      expect(response.manifests[0].carrier_id).to(eq(expected_response[:manifests][0][:carrier_id]))
      expect(response.manifests[0].manifest_download.href).to(eq(expected_response[:manifests][0][:manifest_download][:href]))

      expect(response.manifest_requests[0].manifest_request_id).to(eq(expected_response[:manifest_requests][0][:manifest_request_id]))
      expect(response.manifest_requests[0].status).to(eq(expected_response[:manifest_requests][0][:status]))

      expect(response.request_id).to(eq(expected_response[:request_id]))
      expect(response.errors).to(eq(expected_response[:errors]))
    end
  end

  context "Get Manifests By ID" do
    it "should get manifests by id" do
      manifest_id = "se-28529731"
      params = {}
      expected_response = {
        manifest_id: "se-28529731",
        form_id: "se-28529731",
        created_at: "2019-07-12T13:37:39.050Z",
        ship_date: "2019-07-12T13:37:39.050Z",
        shipments: 100,
        label_ids: ["se-28529731"],
        warehouse_id: "se-28529731",
        submission_id: "9475711899564878915476",
        carrier_id: "se-28529731",
        manifest_download: {
          href: "httpss://api.shipengine.com/v1/labels/se-28529731",
        },
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.manifests.root}/#{manifest_id}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = manifests.manifest_by_id(manifest_id: manifest_id, params: params)

      assert_requested(request, times: 1)

      expect(response.manifest_id).to(eq(expected_response[:manifest_id]))
      expect(response.form_id).to(eq(expected_response[:form_id]))
      expect(response.created_at).to(eq(expected_response[:created_at]))
      expect(response.ship_date).to(eq(expected_response[:ship_date]))
      expect(response.shipments).to(eq(expected_response[:shipments]))
      expect(response.label_ids[0]).to(eq(expected_response[:label_ids][0]))
      expect(response.warehouse_id).to(eq(expected_response[:warehouse_id]))
      expect(response.submission_id).to(eq(expected_response[:submission_id]))
      expect(response.carrier_id).to(eq(expected_response[:carrier_id]))
      expect(response.manifest_download.href).to(eq(expected_response[:manifest_download][:href]))
    end
  end

  context "Get Manifests Request By ID" do
    it "should manifests request by id" do
      manifest_request_id = "se-28529731"
      params = {}
      expected_response = {
        manifests: [
          {
            manifest_id: "se-28529731",
            form_id: "se-28529731",
            created_at: "2019-07-12T13:37:39.050Z",
            ship_date: "2019-07-12T13:37:39.050Z",
            shipments: 100,
            label_ids: ["se-28529731"],
            warehouse_id: "se-28529731",
            submission_id: "9475711899564878915476",
            carrier_id: "se-28529731",
            manifest_download: {
              href: "httpss://api.shipengine.com/v1/labels/se-28529731",
            },
          },
        ],
        manifest_requests: [
          {
            manifest_request_id: "se-28529731",
            status: "in_progress",
          },
        ],
        request_id: "aa3d8e8e-462b-4476-9618-72db7f7b7009",
        errors: [],
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.manifests.manifest_request}/#{manifest_request_id}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = manifests.manifest_request_by_id(manifest_request_id: manifest_request_id, params: params)

      assert_requested(request, times: 1)

      expect(response.manifests[0].manifest_id).to(eq(expected_response[:manifests][0][:manifest_id]))
      expect(response.manifests[0].form_id).to(eq(expected_response[:manifests][0][:form_id]))
      expect(response.manifests[0].created_at).to(eq(expected_response[:manifests][0][:created_at]))
      expect(response.manifests[0].ship_date).to(eq(expected_response[:manifests][0][:ship_date]))
      expect(response.manifests[0].shipments).to(eq(expected_response[:manifests][0][:shipments]))
      expect(response.manifests[0].label_ids[0]).to(eq(expected_response[:manifests][0][:label_ids][0]))
      expect(response.manifests[0].warehouse_id).to(eq(expected_response[:manifests][0][:warehouse_id]))
      expect(response.manifests[0].submission_id).to(eq(expected_response[:manifests][0][:submission_id]))
      expect(response.manifests[0].carrier_id).to(eq(expected_response[:manifests][0][:carrier_id]))
      expect(response.manifests[0].manifest_download.href).to(eq(expected_response[:manifests][0][:manifest_download][:href]))

      expect(response.manifest_requests[0].manifest_request_id).to(eq(expected_response[:manifest_requests][0][:manifest_request_id]))
      expect(response.manifest_requests[0].status).to(eq(expected_response[:manifest_requests][0][:status]))

      expect(response.request_id).to(eq(expected_response[:request_id]))
      expect(response.errors).to(eq(expected_response[:errors]))
    end
  end
end
