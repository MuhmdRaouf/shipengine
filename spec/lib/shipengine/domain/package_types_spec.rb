# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::PackageTypes) do
  let(:package_types) { ShipEngine::Domain::PackageTypes.new }

  context "List Custom Package Types" do
    it "should list custom package types" do
      params = {}
      expected_response = {
        packages: [
          {
            package_id: "se-28529731",
            package_code: "small_flat_rate_box",
            name: "laptop_box",
            dimensions: {
              unit: "inch",
              length: 0,
              width: 0,
              height: 0,
            },
            description: "Packaging for laptops",
          },
        ],
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.package_types.root}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = package_types.list_custom_package_types

      assert_requested(request, times: 1)

      expect(response.packages[0].package_id).to(eq(expected_response[:packages][0][:package_id]))
      expect(response.packages[0].package_code).to(eq(expected_response[:packages][0][:package_code]))
      expect(response.packages[0].name).to(eq(expected_response[:packages][0][:name]))
      expect(response.packages[0].dimensions["unit"]).to(eq(expected_response[:packages][0][:dimensions][:unit]))
      expect(response.packages[0].dimensions["length"]).to(eq(expected_response[:packages][0][:dimensions][:length]))
      expect(response.packages[0].dimensions["width"]).to(eq(expected_response[:packages][0][:dimensions][:width]))
      expect(response.packages[0].dimensions["height"]).to(eq(expected_response[:packages][0][:dimensions][:height]))
      expect(response.packages[0].description).to(eq(expected_response[:packages][0][:description]))
    end
  end

  context "Create Custom Package Type" do
    it "should create custom package type" do
      params = {
        package_id: "se-28529731",
        package_code: "small_flat_rate_box",
        name: "laptop_box",
        dimensions: {
          unit: "inch",
          length: 0,
          width: 0,
          height: 0,
        },
        description: "Packaging for laptops",
      }
      expected_response = {
        package_id: "se-28529731",
        package_code: "small_flat_rate_box",
        name: "laptop_box",
        dimensions: {
          unit: "inch",
          length: 0,
          width: 0,
          height: 0,
        },
        description: "Packaging for laptops",
      }

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.package_types.root}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = package_types.create_custom_package_types(params: params)

      assert_requested(request, times: 1)

      expect(response.package_id).to(eq(expected_response[:package_id]))
      expect(response.package_code).to(eq(expected_response[:package_code]))
      expect(response.name).to(eq(expected_response[:name]))
      expect(response.dimensions["unit"]).to(eq(expected_response[:dimensions][:unit]))
      expect(response.dimensions["length"]).to(eq(expected_response[:dimensions][:length]))
      expect(response.dimensions["width"]).to(eq(expected_response[:dimensions][:width]))
      expect(response.dimensions["height"]).to(eq(expected_response[:dimensions][:height]))
      expect(response.description).to(eq(expected_response[:description]))
    end
  end

  context "Get Custom Package Type By ID" do
    it "should get custom package type by id" do
      package_id = "se-28529731"
      params = {}
      expected_response = {
        package_id: "se-28529731",
        package_code: "small_flat_rate_box",
        name: "laptop_box",
        dimensions: {
          unit: "inch",
          length: 0,
          width: 0,
          height: 0,
        },
        description: "Packaging for laptops",
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.package_types.root}/#{package_id}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = package_types.custom_package_types_by_id(package_id: package_id, params: params)

      assert_requested(request, times: 1)

      expect(response.package_id).to(eq(expected_response[:package_id]))
      expect(response.package_code).to(eq(expected_response[:package_code]))
      expect(response.name).to(eq(expected_response[:name]))
      expect(response.dimensions["unit"]).to(eq(expected_response[:dimensions][:unit]))
      expect(response.dimensions["length"]).to(eq(expected_response[:dimensions][:length]))
      expect(response.dimensions["width"]).to(eq(expected_response[:dimensions][:width]))
      expect(response.dimensions["height"]).to(eq(expected_response[:dimensions][:height]))
      expect(response.description).to(eq(expected_response[:description]))
    end
  end

  context "Update Custom Package Type By ID" do
    it "should update custom package type by id" do
      package_id = "se-28529731"
      params = {
        package_id: "se-28529731",
        package_code: "small_flat_rate_box",
        name: "laptop_box",
        dimensions: {
          unit: "inch",
          length: 0,
          width: 0,
          height: 0,
        },
        description: "Packaging for laptops",
      }
      expected_response = {}

      request = stub_request(
        :put,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.package_types.root}/#{package_id}"
      ).with(body: params).to_return(status: 204, body: expected_response.to_json)

      response = package_types.update_custom_package_types_by_id(package_id: package_id, params: params)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end

  context "Delete Custom Package Type By ID" do
    it "should delete custom package type by id" do
      package_id = "se-28529731"
      params = {}
      expected_response = {}

      request = stub_request(
        :delete,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.package_types.root}/#{package_id}"
      ).with(body: params).to_return(status: 204, body: expected_response.to_json)

      response = package_types.delete_custom_package_types_by_id(package_id: package_id, params: params)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end
end
