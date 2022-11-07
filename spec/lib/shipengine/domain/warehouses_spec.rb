# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::Warehouses) do
  let(:warehouses) { ShipEngine::Domain::Warehouses.new }

  context "List Warehouses" do
    it "should list warehouses" do
      params = {}
      expected_response = {
        warehouses: [
          {
            warehouse_id: "se-28529731",
            name: "Zero Cool HQ",
            created_at: "2019-06-25T18:12:35.583Z",
            origin_address: {
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
            return_address: {
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
          },
        ],
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.warehouses.root}"
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

      response = warehouses.list_warehouses

      assert_requested(request, times: 1)

      expect(response.warehouses[0].warehouse_id).to(eq(expected_response[:warehouses][0][:warehouse_id]))
      expect(response.warehouses[0].name).to(eq(expected_response[:warehouses][0][:name]))
      expect(response.warehouses[0].created_at).to(eq(expected_response[:warehouses][0][:created_at]))

      expect(response.warehouses[0].origin_address.name).to(eq(expected_response[:warehouses][0][:origin_address][:name]))
      expect(response.warehouses[0].origin_address.phone).to(eq(expected_response[:warehouses][0][:origin_address][:phone]))
      expect(response.warehouses[0].origin_address.company_name).to(eq(expected_response[:warehouses][0][:origin_address][:company_name]))
      expect(response.warehouses[0].origin_address.address_line1).to(eq(expected_response[:warehouses][0][:origin_address][:address_line1]))
      expect(response.warehouses[0].origin_address.address_line2).to(eq(expected_response[:warehouses][0][:origin_address][:address_line2]))
      expect(response.warehouses[0].origin_address.address_line3).to(eq(expected_response[:warehouses][0][:origin_address][:address_line3]))
      expect(response.warehouses[0].origin_address.city_locality).to(eq(expected_response[:warehouses][0][:origin_address][:city_locality]))
      expect(response.warehouses[0].origin_address.state_province).to(eq(expected_response[:warehouses][0][:origin_address][:state_province]))
      expect(response.warehouses[0].origin_address.postal_code).to(eq(expected_response[:warehouses][0][:origin_address][:postal_code]))
      expect(response.warehouses[0].origin_address.country_code).to(eq(expected_response[:warehouses][0][:origin_address][:country_code]))
      expect(response.warehouses[0].origin_address.address_residential_indicator).to(eq(expected_response[:warehouses][0][:origin_address][:address_residential_indicator]))

      expect(response.warehouses[0].return_address.name).to(eq(expected_response[:warehouses][0][:return_address][:name]))
      expect(response.warehouses[0].return_address.phone).to(eq(expected_response[:warehouses][0][:return_address][:phone]))
      expect(response.warehouses[0].return_address.company_name).to(eq(expected_response[:warehouses][0][:return_address][:company_name]))
      expect(response.warehouses[0].return_address.address_line1).to(eq(expected_response[:warehouses][0][:return_address][:address_line1]))
      expect(response.warehouses[0].return_address.address_line2).to(eq(expected_response[:warehouses][0][:return_address][:address_line2]))
      expect(response.warehouses[0].return_address.address_line3).to(eq(expected_response[:warehouses][0][:return_address][:address_line3]))
      expect(response.warehouses[0].return_address.city_locality).to(eq(expected_response[:warehouses][0][:return_address][:city_locality]))
      expect(response.warehouses[0].return_address.state_province).to(eq(expected_response[:warehouses][0][:return_address][:state_province]))
      expect(response.warehouses[0].return_address.postal_code).to(eq(expected_response[:warehouses][0][:return_address][:postal_code]))
      expect(response.warehouses[0].return_address.country_code).to(eq(expected_response[:warehouses][0][:return_address][:country_code]))
      expect(response.warehouses[0].return_address.address_residential_indicator).to(eq(expected_response[:warehouses][0][:return_address][:address_residential_indicator]))
    end
  end

  context "Create Warehouse" do
    it "should create warehouse" do
      params = {
        name: "Zero Cool HQ",
        origin_address: {
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
        return_address: {
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
      }
      expected_response = {
        warehouse_id: "se-28529731",
        name: "Zero Cool HQ",
        created_at: "2019-06-25T18:12:35.583Z",
        origin_address: {
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
        return_address: {
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
      }

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.warehouses.root}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = warehouses.create_warehouse(params: params)

      assert_requested(request, times: 1)

      expect(response.warehouse_id).to(eq(expected_response[:warehouse_id]))
      expect(response.name).to(eq(expected_response[:name]))
      expect(response.created_at).to(eq(expected_response[:created_at]))

      expect(response.origin_address.name).to(eq(expected_response[:origin_address][:name]))
      expect(response.origin_address.phone).to(eq(expected_response[:origin_address][:phone]))
      expect(response.origin_address.company_name).to(eq(expected_response[:origin_address][:company_name]))
      expect(response.origin_address.address_line1).to(eq(expected_response[:origin_address][:address_line1]))
      expect(response.origin_address.address_line2).to(eq(expected_response[:origin_address][:address_line2]))
      expect(response.origin_address.address_line3).to(eq(expected_response[:origin_address][:address_line3]))
      expect(response.origin_address.city_locality).to(eq(expected_response[:origin_address][:city_locality]))
      expect(response.origin_address.state_province).to(eq(expected_response[:origin_address][:state_province]))
      expect(response.origin_address.postal_code).to(eq(expected_response[:origin_address][:postal_code]))
      expect(response.origin_address.country_code).to(eq(expected_response[:origin_address][:country_code]))
      expect(response.origin_address.address_residential_indicator).to(eq(expected_response[:origin_address][:address_residential_indicator]))

      expect(response.return_address.name).to(eq(expected_response[:return_address][:name]))
      expect(response.return_address.phone).to(eq(expected_response[:return_address][:phone]))
      expect(response.return_address.company_name).to(eq(expected_response[:return_address][:company_name]))
      expect(response.return_address.address_line1).to(eq(expected_response[:return_address][:address_line1]))
      expect(response.return_address.address_line2).to(eq(expected_response[:return_address][:address_line2]))
      expect(response.return_address.address_line3).to(eq(expected_response[:return_address][:address_line3]))
      expect(response.return_address.city_locality).to(eq(expected_response[:return_address][:city_locality]))
      expect(response.return_address.state_province).to(eq(expected_response[:return_address][:state_province]))
      expect(response.return_address.postal_code).to(eq(expected_response[:return_address][:postal_code]))
      expect(response.return_address.country_code).to(eq(expected_response[:return_address][:country_code]))
      expect(response.return_address.address_residential_indicator).to(eq(expected_response[:return_address][:address_residential_indicator]))
    end
  end

  context "Get Warehouse By Id" do
    it "should get warehouse by id" do
      warehouse_id = "se-28529731"
      params = {}
      expected_response = {
        warehouse_id: "se-28529731",
        name: "Zero Cool HQ",
        created_at: "2019-06-25T18:12:35.583Z",
        origin_address: {
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
        return_address: {
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
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.warehouses.root}/#{warehouse_id}"
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

      response = warehouses.warehouse_by_id(warehouse_id: warehouse_id, params: params)

      assert_requested(request, times: 1)

      expect(response.warehouse_id).to(eq(expected_response[:warehouse_id]))
      expect(response.name).to(eq(expected_response[:name]))
      expect(response.created_at).to(eq(expected_response[:created_at]))

      expect(response.origin_address.name).to(eq(expected_response[:origin_address][:name]))
      expect(response.origin_address.phone).to(eq(expected_response[:origin_address][:phone]))
      expect(response.origin_address.company_name).to(eq(expected_response[:origin_address][:company_name]))
      expect(response.origin_address.address_line1).to(eq(expected_response[:origin_address][:address_line1]))
      expect(response.origin_address.address_line2).to(eq(expected_response[:origin_address][:address_line2]))
      expect(response.origin_address.address_line3).to(eq(expected_response[:origin_address][:address_line3]))
      expect(response.origin_address.city_locality).to(eq(expected_response[:origin_address][:city_locality]))
      expect(response.origin_address.state_province).to(eq(expected_response[:origin_address][:state_province]))
      expect(response.origin_address.postal_code).to(eq(expected_response[:origin_address][:postal_code]))
      expect(response.origin_address.country_code).to(eq(expected_response[:origin_address][:country_code]))
      expect(response.origin_address.address_residential_indicator).to(eq(expected_response[:origin_address][:address_residential_indicator]))

      expect(response.return_address.name).to(eq(expected_response[:return_address][:name]))
      expect(response.return_address.phone).to(eq(expected_response[:return_address][:phone]))
      expect(response.return_address.company_name).to(eq(expected_response[:return_address][:company_name]))
      expect(response.return_address.address_line1).to(eq(expected_response[:return_address][:address_line1]))
      expect(response.return_address.address_line2).to(eq(expected_response[:return_address][:address_line2]))
      expect(response.return_address.address_line3).to(eq(expected_response[:return_address][:address_line3]))
      expect(response.return_address.city_locality).to(eq(expected_response[:return_address][:city_locality]))
      expect(response.return_address.state_province).to(eq(expected_response[:return_address][:state_province]))
      expect(response.return_address.postal_code).to(eq(expected_response[:return_address][:postal_code]))
      expect(response.return_address.country_code).to(eq(expected_response[:return_address][:country_code]))
      expect(response.return_address.address_residential_indicator).to(eq(expected_response[:return_address][:address_residential_indicator]))
    end
  end

  context "Update Warehouse By Id" do
    it "should update warehouse by id" do
      warehouse_id = "se-28529731"
      params = {
        name: "Zero Cool HQ",
      }
      expected_response = {}

      request = stub_request(
        :put,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.warehouses.root}/#{warehouse_id}"
      ).with(body: params).to_return(status: 204, body: expected_response.to_json)

      response = warehouses.update_warehouse_by_id(warehouse_id: warehouse_id, params: params)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end

  context "Delete Warehouse By Id" do
    it "should get warehouse by id" do
      warehouse_id = "se-28529731"
      params = {}
      expected_response = {}

      request = stub_request(
        :delete,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.warehouses.root}/#{warehouse_id}"
      ).with(body: params).to_return(status: 204, body: expected_response.to_json)

      response = warehouses.delete_warehouse_by_id(warehouse_id: warehouse_id, params: params)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end
end
