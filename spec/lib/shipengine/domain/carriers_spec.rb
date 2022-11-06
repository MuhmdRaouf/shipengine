# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::Carriers) do
  let(:carriers) { ShipEngine::Domain::Carriers.new }

  context "List carriers" do
    it "should list carriers" do
      params = {}

      expected_response = {
        carriers: [
          {
            carrier_id: "se-28529731",
            carrier_code: "se-28529731",
            account_number: "account_570827",
            requires_funded_amount: true,
            balance: 3799.52,
            nickname: "ShipEngine Account - Stamps.com",
            friendly_name: "Stamps.com",
            primary: true,
            has_multi_package_supporting_services: true,
            supports_label_messages: true,
            services: [
              {
                carrier_id: "se-28529731",
                carrier_code: "se-28529731",
                service_code: "usps_media_mail",
                name: "USPS First Class Mail",
                domestic: true,
                international: true,
                is_multi_package_supported: true,
              },
            ],
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
            options: [
              {
                name: "contains_alcohol",
                default_value: false,
                description: "string",
              },
            ],
          },
        ],
        request_id: "aa3d8e8e-462b-4476-9618-72db7f7b7009",
        errors: [],
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.carriers.root}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = carriers.list_carriers(params: params)

      assert_requested(request, times: 1)

      expect(response.carriers[0].carrier_id).to(eq(expected_response[:carriers][0][:carrier_id]))
      expect(response.carriers[0].carrier_code).to(eq(expected_response[:carriers][0][:carrier_code]))
      expect(response.carriers[0].account_number).to(eq(expected_response[:carriers][0][:account_number]))
      expect(response.carriers[0].requires_funded_amount).to(eq(expected_response[:carriers][0][:requires_funded_amount]))
      expect(response.carriers[0].balance).to(eq(expected_response[:carriers][0][:balance]))
      expect(response.carriers[0].nickname).to(eq(expected_response[:carriers][0][:nickname]))
      expect(response.carriers[0].friendly_name).to(eq(expected_response[:carriers][0][:friendly_name]))
      expect(response.carriers[0].primary).to(eq(expected_response[:carriers][0][:primary]))
      expect(response.carriers[0].has_multi_package_supporting_services).to(eq(expected_response[:carriers][0][:has_multi_package_supporting_services]))
      expect(response.carriers[0].supports_label_messages).to(eq(expected_response[:carriers][0][:supports_label_messages]))

      expect(response.carriers[0].services[0].carrier_id).to(eq(expected_response[:carriers][0][:services][0][:carrier_id]))
      expect(response.carriers[0].services[0].carrier_code).to(eq(expected_response[:carriers][0][:services][0][:carrier_code]))
      expect(response.carriers[0].services[0].service_code).to(eq(expected_response[:carriers][0][:services][0][:service_code]))
      expect(response.carriers[0].services[0].name).to(eq(expected_response[:carriers][0][:services][0][:name]))
      expect(response.carriers[0].services[0].domestic).to(eq(expected_response[:carriers][0][:services][0][:domestic]))
      expect(response.carriers[0].services[0].international).to(eq(expected_response[:carriers][0][:services][0][:international]))
      expect(response.carriers[0].services[0].is_multi_package_supported).to(eq(expected_response[:carriers][0][:services][0][:is_multi_package_supported]))

      expect(response.carriers[0].packages[0].package_id).to(eq(expected_response[:carriers][0][:packages][0][:package_id]))
      expect(response.carriers[0].packages[0].package_code).to(eq(expected_response[:carriers][0][:packages][0][:package_code]))
      expect(response.carriers[0].packages[0].name).to(eq(expected_response[:carriers][0][:packages][0][:name]))
      expect(response.carriers[0].packages[0].description).to(eq(expected_response[:carriers][0][:packages][0][:description]))

      expect(response.carriers[0].packages[0].dimensions["unit"]).to(eq(expected_response[:carriers][0][:packages][0][:dimensions][:unit]))
      expect(response.carriers[0].packages[0].dimensions["length"]).to(eq(expected_response[:carriers][0][:packages][0][:dimensions][:length]))
      expect(response.carriers[0].packages[0].dimensions["width"]).to(eq(expected_response[:carriers][0][:packages][0][:dimensions][:width]))
      expect(response.carriers[0].packages[0].dimensions["height"]).to(eq(expected_response[:carriers][0][:packages][0][:dimensions][:height]))

      expect(response.carriers[0].options[0].name).to(eq(expected_response[:carriers][0][:options][0][:name]))
      expect(response.carriers[0].options[0].default_value).to(eq(expected_response[:carriers][0][:options][0][:default_value]))
      expect(response.carriers[0].options[0].description).to(eq(expected_response[:carriers][0][:options][0][:description]))

      expect(response.request_id).to(eq(expected_response[:request_id]))
      expect(response.errors).to(eq(expected_response[:errors]))
    end
  end

  context "Get Carrier By ID" do
    it "should get carrier by id" do
      carrier_id = "se-28529731"
      params = {}

      expected_response = {
        carrier_id: "se-28529731",
        carrier_code: "se-28529731",
        account_number: "account_570827",
        requires_funded_amount: true,
        balance: 3799.52,
        nickname: "ShipEngine Account - Stamps.com",
        friendly_name: "Stamps.com",
        primary: true,
        has_multi_package_supporting_services: true,
        supports_label_messages: true,
        services: [
          {
            carrier_id: "se-28529731",
            carrier_code: "se-28529731",
            service_code: "usps_media_mail",
            name: "USPS First Class Mail",
            domestic: true,
            international: true,
            is_multi_package_supported: true,
          },
        ],
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
        options: [
          {
            name: "contains_alcohol",
            default_value: false,
            description: "string",
          },
        ],
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.carriers.root}/#{carrier_id}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = carriers.carrier_by_id(carrier_id: carrier_id, params: params)

      assert_requested(request, times: 1)

      expect(response.carrier_id).to(eq(expected_response[:carrier_id]))
      expect(response.carrier_code).to(eq(expected_response[:carrier_code]))
      expect(response.account_number).to(eq(expected_response[:account_number]))
      expect(response.requires_funded_amount).to(eq(expected_response[:requires_funded_amount]))
      expect(response.balance).to(eq(expected_response[:balance]))
      expect(response.nickname).to(eq(expected_response[:nickname]))
      expect(response.friendly_name).to(eq(expected_response[:friendly_name]))
      expect(response.primary).to(eq(expected_response[:primary]))
      expect(response.has_multi_package_supporting_services).to(eq(expected_response[:has_multi_package_supporting_services]))
      expect(response.supports_label_messages).to(eq(expected_response[:supports_label_messages]))

      expect(response.services[0].carrier_id).to(eq(expected_response[:services][0][:carrier_id]))
      expect(response.services[0].carrier_code).to(eq(expected_response[:services][0][:carrier_code]))
      expect(response.services[0].service_code).to(eq(expected_response[:services][0][:service_code]))
      expect(response.services[0].name).to(eq(expected_response[:services][0][:name]))
      expect(response.services[0].domestic).to(eq(expected_response[:services][0][:domestic]))
      expect(response.services[0].international).to(eq(expected_response[:services][0][:international]))
      expect(response.services[0].is_multi_package_supported).to(eq(expected_response[:services][0][:is_multi_package_supported]))

      expect(response.packages[0].package_id).to(eq(expected_response[:packages][0][:package_id]))
      expect(response.packages[0].package_code).to(eq(expected_response[:packages][0][:package_code]))
      expect(response.packages[0].name).to(eq(expected_response[:packages][0][:name]))
      expect(response.packages[0].description).to(eq(expected_response[:packages][0][:description]))

      expect(response.packages[0].dimensions["unit"]).to(eq(expected_response[:packages][0][:dimensions][:unit]))
      expect(response.packages[0].dimensions["length"]).to(eq(expected_response[:packages][0][:dimensions][:length]))
      expect(response.packages[0].dimensions["width"]).to(eq(expected_response[:packages][0][:dimensions][:width]))
      expect(response.packages[0].dimensions["height"]).to(eq(expected_response[:packages][0][:dimensions][:height]))

      expect(response.options[0].name).to(eq(expected_response[:options][0][:name]))
      expect(response.options[0].default_value).to(eq(expected_response[:options][0][:default_value]))
      expect(response.options[0].description).to(eq(expected_response[:options][0][:description]))
    end
  end

  context "Add Funds To Carrier" do
    it "should add funds to carrier by id" do
      carrier_id = "se-28529731"
      params = {
        currency: "USD",
        amount: 10,
      }

      expected_response = {
        balance: {
          currency: "USD",
          amount: 10,
        },
      }

      request = stub_request(
        :put,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.carriers.root}/#{carrier_id}/add_funds"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = carriers.add_funds_to_carrier(carrier_id: carrier_id, params: params)

      assert_requested(request, times: 1)

      expect(response.balance.currency).to(eq(expected_response[:balance][:currency]))
      expect(response.balance.amount).to(eq(expected_response[:balance][:amount]))
    end
  end

  context "Get Carrier Options" do
    it "should get carrier options" do
      carrier_id = "se-28529731"
      params = {}
      expected_response = {
        options: [
          {
            name: "contains_alcohol",
            default_value: false,
            description: "string",
          },
        ],
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.carriers.root}/#{carrier_id}/options"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = carriers.carrier_options(carrier_id: carrier_id, params: params)

      assert_requested(request, times: 1)

      expect(response.options[0].name).to(eq(expected_response[:options][0][:name]))
      expect(response.options[0].default_value).to(eq(expected_response[:options][0][:default_value]))
      expect(response.options[0].description).to(eq(expected_response[:options][0][:description]))
    end
  end

  context "List Carrier Package Types" do
    it "should list carrier package types" do
      carrier_id = "se-28529731"
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
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.carriers.root}/#{carrier_id}/packages"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = carriers.list_carrier_package_types(carrier_id: carrier_id, params: params)

      assert_requested(request, times: 1)

      expect(response.packages[0].package_id).to(eq(expected_response[:packages][0][:package_id]))
      expect(response.packages[0].package_code).to(eq(expected_response[:packages][0][:package_code]))
      expect(response.packages[0].name).to(eq(expected_response[:packages][0][:name]))
      expect(response.packages[0].description).to(eq(expected_response[:packages][0][:description]))

      expect(response.packages[0].dimensions["unit"]).to(eq(expected_response[:packages][0][:dimensions][:unit]))
      expect(response.packages[0].dimensions["length"]).to(eq(expected_response[:packages][0][:dimensions][:length]))
      expect(response.packages[0].dimensions["width"]).to(eq(expected_response[:packages][0][:dimensions][:width]))
      expect(response.packages[0].dimensions["height"]).to(eq(expected_response[:packages][0][:dimensions][:height]))
    end
  end

  context "List Carrier Services" do
    it "should list carrier services" do
      carrier_id = "se-28529731"
      params = {}
      expected_response = {
        services: [
          {
            carrier_id: "se-28529731",
            carrier_code: "se-28529731",
            service_code: "usps_media_mail",
            name: "USPS First Class Mail",
            domestic: true,
            international: true,
            is_multi_package_supported: true,
          },
        ],
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.carriers.root}/#{carrier_id}/services"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = carriers.list_carrier_services(carrier_id: carrier_id, params: params)

      assert_requested(request, times: 1)

      expect(response.services[0].carrier_id).to(eq(expected_response[:services][0][:carrier_id]))
      expect(response.services[0].carrier_code).to(eq(expected_response[:services][0][:carrier_code]))
      expect(response.services[0].service_code).to(eq(expected_response[:services][0][:service_code]))
      expect(response.services[0].name).to(eq(expected_response[:services][0][:name]))
      expect(response.services[0].domestic).to(eq(expected_response[:services][0][:domestic]))
      expect(response.services[0].international).to(eq(expected_response[:services][0][:international]))
      expect(response.services[0].is_multi_package_supported).to(eq(expected_response[:services][0][:is_multi_package_supported]))
    end
  end
end
