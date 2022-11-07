# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::ServicePoints) do
  let(:service_points) { ShipEngine::Domain::ServicePoints.new }

  context "List Service Points" do
    it "should list service points" do
      params = {
        address_query: "177A Bleecker Street New York",
        address: {
          address_line1: "string",
          address_line2: "string",
          address_line3: "string",
          city_locality: "string",
          state_province: "string",
          postal_code: "string",
          country_code: "string",
        },
        providers: [{
          carrier_id: "se-123456",
          service_code: ["chronoclassic"],
        }],
        lat: 48.874518928233094,
        long: 2.3591775711639404,
        radius: 500,
        max_results: 25,
      }
      expected_response = {
        service_points: [
          {
            carrier_code: "chronopost",
            service_codes: ["chronoclassic"],
            service_point_id: "614940",
            address: {
              phone_number: "555-555-5555",
              company_name: "My fancy company name",
              description: "This is a description of the service point",
              geo: {
                lat: 48.842608,
                long: 0.032875,
              },
              address_line1: "PLACE DU CANADA",
              city_locality: "TRUN",
              state_province: "TRUN",
              postal_code: "61160",
              country_code: "FR",
            },
            hours_of_operation: {
              monday: [{ open: "09:15", close: "12:00" }],
              tuesday: [{ open: "09:15", close: "12:00" }],
              wednesday: [{ open: "09:15", close: "12:00" }],
              thursday: [{ open: "09:15", close: "12:00" }],
              friday: [{ open: "09:15", close: "12:00" }],
              saturday: [{ open: "09:15", close: "12:00" }],
              sunday: [{ open: "09:15", close: "12:00" }],
            },
            features: ["drop_off_point"],
          },
        ],
        errors: [],
      }

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.service_points.root}/list"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = service_points.list_service_points(params: params)

      assert_requested(request, times: 1)

      expect(response.service_points[0].carrier_code).to(eq(expected_response[:service_points][0][:carrier_code]))
      expect(response.service_points[0].service_codes).to(eq(expected_response[:service_points][0][:service_codes]))
      expect(response.service_points[0].service_point_id).to(eq(expected_response[:service_points][0][:service_point_id]))

      expect(response.service_points[0].address.phone_number).to(eq(expected_response[:service_points][0][:address][:phone_number]))
      expect(response.service_points[0].address.company_name).to(eq(expected_response[:service_points][0][:address][:company_name]))
      expect(response.service_points[0].address.description).to(eq(expected_response[:service_points][0][:address][:description]))
      expect(response.service_points[0].address.geo.lat).to(eq(expected_response[:service_points][0][:address][:geo][:lat]))
      expect(response.service_points[0].address.geo.long).to(eq(expected_response[:service_points][0][:address][:geo][:long]))
      expect(response.service_points[0].address.address_line1).to(eq(expected_response[:service_points][0][:address][:address_line1]))
      expect(response.service_points[0].address.city_locality).to(eq(expected_response[:service_points][0][:address][:city_locality]))
      expect(response.service_points[0].address.state_province).to(eq(expected_response[:service_points][0][:address][:state_province]))
      expect(response.service_points[0].address.postal_code).to(eq(expected_response[:service_points][0][:address][:postal_code]))
      expect(response.service_points[0].address.country_code).to(eq(expected_response[:service_points][0][:address][:country_code]))

      expect(response.service_points[0].hours_of_operation.monday[0].open).to(eq(expected_response[:service_points][0][:hours_of_operation][:monday][0][:open]))
      expect(response.service_points[0].hours_of_operation.monday[0].close).to(eq(expected_response[:service_points][0][:hours_of_operation][:monday][0][:close]))

      expect(response.service_points[0].hours_of_operation.tuesday[0].open).to(eq(expected_response[:service_points][0][:hours_of_operation][:tuesday][0][:open]))
      expect(response.service_points[0].hours_of_operation.tuesday[0].close).to(eq(expected_response[:service_points][0][:hours_of_operation][:tuesday][0][:close]))

      expect(response.service_points[0].hours_of_operation.wednesday[0].open).to(eq(expected_response[:service_points][0][:hours_of_operation][:wednesday][0][:open]))
      expect(response.service_points[0].hours_of_operation.wednesday[0].close).to(eq(expected_response[:service_points][0][:hours_of_operation][:wednesday][0][:close]))

      expect(response.service_points[0].hours_of_operation.thursday[0].open).to(eq(expected_response[:service_points][0][:hours_of_operation][:thursday][0][:open]))
      expect(response.service_points[0].hours_of_operation.thursday[0].close).to(eq(expected_response[:service_points][0][:hours_of_operation][:thursday][0][:close]))

      expect(response.service_points[0].hours_of_operation.friday[0].open).to(eq(expected_response[:service_points][0][:hours_of_operation][:friday][0][:open]))
      expect(response.service_points[0].hours_of_operation.friday[0].close).to(eq(expected_response[:service_points][0][:hours_of_operation][:friday][0][:close]))

      expect(response.service_points[0].hours_of_operation.saturday[0].open).to(eq(expected_response[:service_points][0][:hours_of_operation][:saturday][0][:open]))
      expect(response.service_points[0].hours_of_operation.saturday[0].close).to(eq(expected_response[:service_points][0][:hours_of_operation][:saturday][0][:close]))

      expect(response.service_points[0].hours_of_operation.sunday[0].open).to(eq(expected_response[:service_points][0][:hours_of_operation][:sunday][0][:open]))
      expect(response.service_points[0].hours_of_operation.sunday[0].close).to(eq(expected_response[:service_points][0][:hours_of_operation][:sunday][0][:close]))

      expect(response.service_points[0].features).to(eq(expected_response[:service_points][0][:features]))

      expect(response.errors).to(eq(expected_response[:errors]))
    end
  end

  context "Get Service Point By ID" do
    it "should get service point by id" do
      carrier_code = "stamps_com"
      country_code = "CA"
      service_point_id = "614940"
      params = {}
      expected_response = {
        service_point: {
          carrier_code: "chronopost",
          service_codes: ["chronoclassic"],
          service_point_id: "614940",
          address: {
            phone_number: "555-555-5555",
            company_name: "My fancy company name",
            description: "This is a description of the service point",
            geo: {
              lat: 48.842608,
              long: 0.032875,
            },
            address_line1: "PLACE DU CANADA",
            city_locality: "TRUN",
            state_province: "TRUN",
            postal_code: "61160",
            country_code: "FR",
          },
          hours_of_operation: {
            monday: [{ open: "09:15", close: "12:00" }],
            tuesday: [{ open: "09:15", close: "12:00" }],
            wednesday: [{ open: "09:15", close: "12:00" }],
            thursday: [{ open: "09:15", close: "12:00" }],
            friday: [{ open: "09:15", close: "12:00" }],
            saturday: [{ open: "09:15", close: "12:00" }],
            sunday: [{ open: "09:15", close: "12:00" }],
          },
          features: ["drop_off_point"],
        },
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.service_points.root}/#{carrier_code}/#{country_code}/#{service_point_id}"
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

      response = service_points.service_point_by_id(
        carrier_code: carrier_code,
        country_code: country_code,
        service_point_id: service_point_id,
        params: params
      )

      assert_requested(request, times: 1)

      expect(response.service_point.carrier_code).to(eq(expected_response[:service_point][:carrier_code]))
      expect(response.service_point.service_codes).to(eq(expected_response[:service_point][:service_codes]))
      expect(response.service_point.service_point_id).to(eq(expected_response[:service_point][:service_point_id]))

      expect(response.service_point.address.phone_number).to(eq(expected_response[:service_point][:address][:phone_number]))
      expect(response.service_point.address.company_name).to(eq(expected_response[:service_point][:address][:company_name]))
      expect(response.service_point.address.description).to(eq(expected_response[:service_point][:address][:description]))
      expect(response.service_point.address.geo.lat).to(eq(expected_response[:service_point][:address][:geo][:lat]))
      expect(response.service_point.address.geo.long).to(eq(expected_response[:service_point][:address][:geo][:long]))
      expect(response.service_point.address.address_line1).to(eq(expected_response[:service_point][:address][:address_line1]))
      expect(response.service_point.address.city_locality).to(eq(expected_response[:service_point][:address][:city_locality]))
      expect(response.service_point.address.state_province).to(eq(expected_response[:service_point][:address][:state_province]))
      expect(response.service_point.address.postal_code).to(eq(expected_response[:service_point][:address][:postal_code]))
      expect(response.service_point.address.country_code).to(eq(expected_response[:service_point][:address][:country_code]))

      expect(response.service_point.hours_of_operation.monday[0].open).to(eq(expected_response[:service_point][:hours_of_operation][:monday][0][:open]))
      expect(response.service_point.hours_of_operation.monday[0].close).to(eq(expected_response[:service_point][:hours_of_operation][:monday][0][:close]))

      expect(response.service_point.hours_of_operation.tuesday[0].open).to(eq(expected_response[:service_point][:hours_of_operation][:tuesday][0][:open]))
      expect(response.service_point.hours_of_operation.tuesday[0].close).to(eq(expected_response[:service_point][:hours_of_operation][:tuesday][0][:close]))

      expect(response.service_point.hours_of_operation.wednesday[0].open).to(eq(expected_response[:service_point][:hours_of_operation][:wednesday][0][:open]))
      expect(response.service_point.hours_of_operation.wednesday[0].close).to(eq(expected_response[:service_point][:hours_of_operation][:wednesday][0][:close]))

      expect(response.service_point.hours_of_operation.thursday[0].open).to(eq(expected_response[:service_point][:hours_of_operation][:thursday][0][:open]))
      expect(response.service_point.hours_of_operation.thursday[0].close).to(eq(expected_response[:service_point][:hours_of_operation][:thursday][0][:close]))

      expect(response.service_point.hours_of_operation.friday[0].open).to(eq(expected_response[:service_point][:hours_of_operation][:friday][0][:open]))
      expect(response.service_point.hours_of_operation.friday[0].close).to(eq(expected_response[:service_point][:hours_of_operation][:friday][0][:close]))

      expect(response.service_point.hours_of_operation.saturday[0].open).to(eq(expected_response[:service_point][:hours_of_operation][:saturday][0][:open]))
      expect(response.service_point.hours_of_operation.saturday[0].close).to(eq(expected_response[:service_point][:hours_of_operation][:saturday][0][:close]))

      expect(response.service_point.hours_of_operation.sunday[0].open).to(eq(expected_response[:service_point][:hours_of_operation][:sunday][0][:open]))
      expect(response.service_point.hours_of_operation.sunday[0].close).to(eq(expected_response[:service_point][:hours_of_operation][:sunday][0][:close]))

      expect(response.service_point.features).to(eq(expected_response[:service_point][:features]))
    end
  end
end
