# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::PackagePickups) do
  let(:package_pickups) { ShipEngine::Domain::PackagePickups.new }

  context "List Scheduled Pickups" do
    it "should list scheduled pickups" do
      params = {}
      expected_response = {
        pickups: [
          {
            pickup_id: "pik_3YcKU5zdtJuCqoeNwyqqbW",
            label_ids: ["se-28529731"],
            created_at: "2018-09-23T15:00:00.000Z",
            cancelled_at: "2018-09-23T15:00:00.000Z",
            carrier_id: "se-28529731",
            confirmation_number: "292513CL4A3",
            warehouse_id: "se-28529731",
            pickup_address: {
              name: "John Doe",
              phone: "+1 204-253-9411 ext. 123",
              company_name: "The Home Depot",
              address_line1: "1999 Bishop Grandin Blvd.",
              address_line2: "Unit 408",
              address_line3: "Building #7",
              city_locality: "Winnipeg",
              state_province: "Manitoba",
              postal_code: "78756-3717",
              country_code: "CA",
              address_residential_indicator: "no",
            },
            contact_details: {
              name: "string",
              email: "john.doe@example.com",
              phone: "strings",
            },
            pickup_notes: "string",
            pickup_windows: [
              {
                start_at: "2018-09-23T15:00:00.000Z",
                end_at: "2018-09-23T15:00:00.000Z",
              },
            ],
          },
        ],
        total: 3,
        page: 3,
        pages: 4,
        links: {
          first: {
            href: "http://api.shipengine.com/v1/labels/se-28529731",
            type: "string",
          },
          last: {
            href: "http://api.shipengine.com/v1/labels/se-28529731",
            type: "string",
          },
          prev: {
            href: "http://api.shipengine.com/v1/labels/se-28529731",
            type: "string",
          },
          next: {
            href: "http://api.shipengine.com/v1/labels/se-28529731",
            type: "string",
          },
        },
        request_id: "aa3d8e8e-462b-4476-9618-72db7f7b7009",
        errors: [],
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.package_pickups.root}"
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

      response = package_pickups.list_package_pickups

      assert_requested(request, times: 1)

      expect(response.pickups[0].pickup_id).to(eq(expected_response[:pickups][0][:pickup_id]))
      expect(response.pickups[0].label_ids).to(eq(expected_response[:pickups][0][:label_ids]))
      expect(response.pickups[0].created_at).to(eq(expected_response[:pickups][0][:created_at]))
      expect(response.pickups[0].cancelled_at).to(eq(expected_response[:pickups][0][:cancelled_at]))
      expect(response.pickups[0].carrier_id).to(eq(expected_response[:pickups][0][:carrier_id]))
      expect(response.pickups[0].confirmation_number).to(eq(expected_response[:pickups][0][:confirmation_number]))
      expect(response.pickups[0].warehouse_id).to(eq(expected_response[:pickups][0][:warehouse_id]))

      expect(response.pickups[0].pickup_address.name).to(eq(expected_response[:pickups][0][:pickup_address][:name]))
      expect(response.pickups[0].pickup_address.phone).to(eq(expected_response[:pickups][0][:pickup_address][:phone]))
      expect(response.pickups[0].pickup_address.company_name).to(eq(expected_response[:pickups][0][:pickup_address][:company_name]))
      expect(response.pickups[0].pickup_address.address_line1).to(eq(expected_response[:pickups][0][:pickup_address][:address_line1]))
      expect(response.pickups[0].pickup_address.address_line2).to(eq(expected_response[:pickups][0][:pickup_address][:address_line2]))
      expect(response.pickups[0].pickup_address.address_line3).to(eq(expected_response[:pickups][0][:pickup_address][:address_line3]))
      expect(response.pickups[0].pickup_address.city_locality).to(eq(expected_response[:pickups][0][:pickup_address][:city_locality]))
      expect(response.pickups[0].pickup_address.state_province).to(eq(expected_response[:pickups][0][:pickup_address][:state_province]))
      expect(response.pickups[0].pickup_address.postal_code).to(eq(expected_response[:pickups][0][:pickup_address][:postal_code]))
      expect(response.pickups[0].pickup_address.country_code).to(eq(expected_response[:pickups][0][:pickup_address][:country_code]))
      expect(response.pickups[0].pickup_address.address_residential_indicator).to(eq(expected_response[:pickups][0][:pickup_address][:address_residential_indicator]))

      expect(response.pickups[0].contact_details.name).to(eq(expected_response[:pickups][0][:contact_details][:name]))
      expect(response.pickups[0].contact_details.email).to(eq(expected_response[:pickups][0][:contact_details][:email]))
      expect(response.pickups[0].contact_details.phone).to(eq(expected_response[:pickups][0][:contact_details][:phone]))

      expect(response.pickups[0].pickup_notes).to(eq(expected_response[:pickups][0][:pickup_notes]))
      expect(response.pickups[0].pickup_windows[0].start_at).to(eq(expected_response[:pickups][0][:pickup_windows][0][:start_at]))
      expect(response.pickups[0].pickup_windows[0].end_at).to(eq(expected_response[:pickups][0][:pickup_windows][0][:end_at]))

      expect(response.total).to(eq(expected_response[:total]))
      expect(response.page).to(eq(expected_response[:page]))
      expect(response.pages).to(eq(expected_response[:pages]))
      expect(response.links["first"]["href"]).to(eq(expected_response[:links][:first][:href]))
      expect(response.links["last"]["href"]).to(eq(expected_response[:links][:last][:href]))
      expect(response.links["prev"]["href"]).to(eq(expected_response[:links][:prev][:href]))
      expect(response.links["next"]["href"]).to(eq(expected_response[:links][:next][:href]))

      expect(response.request_id).to(eq(expected_response[:request_id]))
      expect(response.errors).to(eq(expected_response[:errors]))
    end
  end

  context "Schedule a Pickup" do
    it "should schedule a pickup" do
      params = {
        label_ids: ["se-28529731"],
        contact_details: {
          name: "string",
          email: "john.doe@example.com",
          phone: "strings",
        },
        pickup_notes: "string",
        pickup_window: {
          start_at: "2018-09-23T15:00:00.000Z",
          end_at: "2018-09-23T15:00:00.000Z",
        },
      }
      expected_response = {
        pickup_id: "pik_3YcKU5zdtJuCqoeNwyqqbW",
        label_ids: ["se-28529731"],
        created_at: "2018-09-23T15:00:00.000Z",
        cancelled_at: "2018-09-23T15:00:00.000Z",
        carrier_id: "se-28529731",
        confirmation_number: "292513CL4A3",
        warehouse_id: "se-28529731",
        pickup_address: {
          name: "John Doe",
          phone: "+1 204-253-9411 ext. 123",
          company_name: "The Home Depot",
          address_line1: "1999 Bishop Grandin Blvd.",
          address_line2: "Unit 408",
          address_line3: "Building #7",
          city_locality: "Winnipeg",
          state_province: "Manitoba",
          postal_code: "78756-3717",
          country_code: "CA",
          address_residential_indicator: "no",
        },
        contact_details: {
          name: "string",
          email: "john.doe@example.com",
          phone: "strings",
        },
        pickup_notes: "string",
        pickup_windows: [
          {
            start_at: "2018-09-23T15:00:00.000Z",
            end_at: "2018-09-23T15:00:00.000Z",
          },
        ],
        request_id: "aa3d8e8e-462b-4476-9618-72db7f7b7009",
        errors: [],
      }

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.package_pickups.root}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = package_pickups.schedule_pickup(params: params)

      assert_requested(request, times: 1)

      expect(response.pickup_id).to(eq(expected_response[:pickup_id]))
      expect(response.label_ids).to(eq(expected_response[:label_ids]))
      expect(response.created_at).to(eq(expected_response[:created_at]))
      expect(response.cancelled_at).to(eq(expected_response[:cancelled_at]))
      expect(response.carrier_id).to(eq(expected_response[:carrier_id]))
      expect(response.confirmation_number).to(eq(expected_response[:confirmation_number]))
      expect(response.warehouse_id).to(eq(expected_response[:warehouse_id]))

      expect(response.pickup_address.name).to(eq(expected_response[:pickup_address][:name]))
      expect(response.pickup_address.phone).to(eq(expected_response[:pickup_address][:phone]))
      expect(response.pickup_address.company_name).to(eq(expected_response[:pickup_address][:company_name]))
      expect(response.pickup_address.address_line1).to(eq(expected_response[:pickup_address][:address_line1]))
      expect(response.pickup_address.address_line2).to(eq(expected_response[:pickup_address][:address_line2]))
      expect(response.pickup_address.address_line3).to(eq(expected_response[:pickup_address][:address_line3]))
      expect(response.pickup_address.city_locality).to(eq(expected_response[:pickup_address][:city_locality]))
      expect(response.pickup_address.state_province).to(eq(expected_response[:pickup_address][:state_province]))
      expect(response.pickup_address.postal_code).to(eq(expected_response[:pickup_address][:postal_code]))
      expect(response.pickup_address.country_code).to(eq(expected_response[:pickup_address][:country_code]))
      expect(response.pickup_address.address_residential_indicator).to(eq(expected_response[:pickup_address][:address_residential_indicator]))

      expect(response.contact_details.name).to(eq(expected_response[:contact_details][:name]))
      expect(response.contact_details.email).to(eq(expected_response[:contact_details][:email]))
      expect(response.contact_details.phone).to(eq(expected_response[:contact_details][:phone]))

      expect(response.pickup_notes).to(eq(expected_response[:pickup_notes]))
      expect(response.pickup_windows[0].start_at).to(eq(expected_response[:pickup_windows][0][:start_at]))
      expect(response.pickup_windows[0].end_at).to(eq(expected_response[:pickup_windows][0][:end_at]))

      expect(response.request_id).to(eq(expected_response[:request_id]))
      expect(response.errors).to(eq(expected_response[:errors]))
    end
  end

  context "Get Pickup By ID" do
    it "should get pickup by id" do
      pickup_id = "pik_3YcKU5zdtJuCqoeNwyqqbW"
      params = {}
      expected_response = {
        pickup_id: "pik_3YcKU5zdtJuCqoeNwyqqbW",
        label_ids: ["se-28529731"],
        created_at: "2018-09-23T15:00:00.000Z",
        cancelled_at: "2018-09-23T15:00:00.000Z",
        carrier_id: "se-28529731",
        confirmation_number: "292513CL4A3",
        warehouse_id: "se-28529731",
        pickup_address: {
          name: "John Doe",
          phone: "+1 204-253-9411 ext. 123",
          company_name: "The Home Depot",
          address_line1: "1999 Bishop Grandin Blvd.",
          address_line2: "Unit 408",
          address_line3: "Building #7",
          city_locality: "Winnipeg",
          state_province: "Manitoba",
          postal_code: "78756-3717",
          country_code: "CA",
          address_residential_indicator: "no",
        },
        contact_details: {
          name: "string",
          email: "john.doe@example.com",
          phone: "strings",
        },
        pickup_notes: "string",
        pickup_windows: [
          {
            start_at: "2018-09-23T15:00:00.000Z",
            end_at: "2018-09-23T15:00:00.000Z",
          },
        ],
        request_id: "aa3d8e8e-462b-4476-9618-72db7f7b7009",
        errors: [],
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.package_pickups.root}/#{pickup_id}"
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

      response = package_pickups.pickup_by_id(pickup_id: pickup_id, params: params)

      assert_requested(request, times: 1)

      expect(response.pickup_id).to(eq(expected_response[:pickup_id]))
      expect(response.label_ids).to(eq(expected_response[:label_ids]))
      expect(response.created_at).to(eq(expected_response[:created_at]))
      expect(response.cancelled_at).to(eq(expected_response[:cancelled_at]))
      expect(response.carrier_id).to(eq(expected_response[:carrier_id]))
      expect(response.confirmation_number).to(eq(expected_response[:confirmation_number]))
      expect(response.warehouse_id).to(eq(expected_response[:warehouse_id]))

      expect(response.pickup_address.name).to(eq(expected_response[:pickup_address][:name]))
      expect(response.pickup_address.phone).to(eq(expected_response[:pickup_address][:phone]))
      expect(response.pickup_address.company_name).to(eq(expected_response[:pickup_address][:company_name]))
      expect(response.pickup_address.address_line1).to(eq(expected_response[:pickup_address][:address_line1]))
      expect(response.pickup_address.address_line2).to(eq(expected_response[:pickup_address][:address_line2]))
      expect(response.pickup_address.address_line3).to(eq(expected_response[:pickup_address][:address_line3]))
      expect(response.pickup_address.city_locality).to(eq(expected_response[:pickup_address][:city_locality]))
      expect(response.pickup_address.state_province).to(eq(expected_response[:pickup_address][:state_province]))
      expect(response.pickup_address.postal_code).to(eq(expected_response[:pickup_address][:postal_code]))
      expect(response.pickup_address.country_code).to(eq(expected_response[:pickup_address][:country_code]))
      expect(response.pickup_address.address_residential_indicator).to(eq(expected_response[:pickup_address][:address_residential_indicator]))

      expect(response.contact_details.name).to(eq(expected_response[:contact_details][:name]))
      expect(response.contact_details.email).to(eq(expected_response[:contact_details][:email]))
      expect(response.contact_details.phone).to(eq(expected_response[:contact_details][:phone]))

      expect(response.pickup_notes).to(eq(expected_response[:pickup_notes]))
      expect(response.pickup_windows[0].start_at).to(eq(expected_response[:pickup_windows][0][:start_at]))
      expect(response.pickup_windows[0].end_at).to(eq(expected_response[:pickup_windows][0][:end_at]))

      expect(response.request_id).to(eq(expected_response[:request_id]))
      expect(response.errors).to(eq(expected_response[:errors]))
    end
  end

  context "Delete a Scheduled Pickup" do
    it "should delete a scheduled pickup" do
      pickup_id = "pik_3YcKU5zdtJuCqoeNwyqqbW"
      params = {}
      expected_response = {
        pickup_id: "pik_3YcKU5zdtJuCqoeNwyqqbW",
        request_id: "aa3d8e8e-462b-4476-9618-72db7f7b7009",
        errors: [],
      }

      request = stub_request(
        :delete,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.package_pickups.root}/#{pickup_id}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = package_pickups.delete_schedule_pickup(pickup_id: pickup_id, params: params)

      assert_requested(request, times: 1)

      expect(response.pickup_id).to(eq(expected_response[:pickup_id]))
      expect(response.request_id).to(eq(expected_response[:request_id]))
      expect(response.errors).to(eq(expected_response[:errors]))
    end
  end
end
