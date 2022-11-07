# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::Tracking) do
  let(:tracking) { ShipEngine::Domain::Tracking.new }

  context "Get Tracking Information" do
    it "should get tracking information" do
      params = {}
      expected_response = {
        tracking_number: "1Z932R800392060079",
        tracking_url: "https://www.fedex.com/fedextrack/?action=track&trackingnumber=1234",
        status_code: "un",
        carrier_code: "dhl_express",
        carrier_id: "se-28529731",
        status_description: "Delivered",
        carrier_status_code: 1,
        carrier_detail_code: "OT",
        carrier_status_description: "Your item was delivered in or at the mailbox at 9:10 am on March",
        ship_date: "2018-09-23T15:00:00.000Z",
        estimated_delivery_date: "2018-09-23T15:00:00.000Z",
        actual_delivery_date: "2018-09-23T15:00:00.000Z",
        exception_description: "string",
        events: [
          {
            occurred_at: "2018-09-23T15:00:00.000Z",
            carrier_occurred_at: "2018-09-23T15:00:00.000Z",
            description: "Delivered, In/At Mailbox",
            city_locality: "AUSTIN",
            state_province: "TX",
            postal_code: 78756,
            country_code: "CA",
            company_name: "Stamps.com",
            signer: "string",
            event_code: "string",
            carrier_detail_code: "OT",
            status_code: "un",
            status_description: "In Transit",
            carrier_status_code: 1,
            carrier_status_description: "Your item was delivered in or at the mailbox at 9:10 am on March",
            latitude: -90,
            longitude: -180,
          },
        ],
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.tracking.root}"
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

      response = tracking.tracking_information(params: params)

      assert_requested(request, times: 1)

      expect(response.tracking_number).to(eq(expected_response[:tracking_number]))
      expect(response.tracking_url).to(eq(expected_response[:tracking_url]))
      expect(response.status_code).to(eq(expected_response[:status_code]))
      expect(response.carrier_code).to(eq(expected_response[:carrier_code]))
      expect(response.carrier_id).to(eq(expected_response[:carrier_id]))
      expect(response.status_description).to(eq(expected_response[:status_description]))
      expect(response.carrier_status_code).to(eq(expected_response[:carrier_status_code]))
      expect(response.carrier_detail_code).to(eq(expected_response[:carrier_detail_code]))
      expect(response.carrier_status_description).to(eq(expected_response[:carrier_status_description]))
      expect(response.ship_date).to(eq(expected_response[:ship_date]))
      expect(response.estimated_delivery_date).to(eq(expected_response[:estimated_delivery_date]))
      expect(response.actual_delivery_date).to(eq(expected_response[:actual_delivery_date]))
      expect(response.exception_description).to(eq(expected_response[:exception_description]))
      expect(response.events[0].occurred_at).to(eq(expected_response[:events][0][:occurred_at]))
      expect(response.events[0].carrier_occurred_at).to(eq(expected_response[:events][0][:carrier_occurred_at]))
      expect(response.events[0].description).to(eq(expected_response[:events][0][:description]))
      expect(response.events[0].city_locality).to(eq(expected_response[:events][0][:city_locality]))
      expect(response.events[0].state_province).to(eq(expected_response[:events][0][:state_province]))
      expect(response.events[0].postal_code).to(eq(expected_response[:events][0][:postal_code]))
      expect(response.events[0].country_code).to(eq(expected_response[:events][0][:country_code]))
      expect(response.events[0].company_name).to(eq(expected_response[:events][0][:company_name]))
      expect(response.events[0].signer).to(eq(expected_response[:events][0][:signer]))
      expect(response.events[0].event_code).to(eq(expected_response[:events][0][:event_code]))
      expect(response.events[0].carrier_detail_code).to(eq(expected_response[:events][0][:carrier_detail_code]))
      expect(response.events[0].status_code).to(eq(expected_response[:events][0][:status_code]))
      expect(response.events[0].status_description).to(eq(expected_response[:events][0][:status_description]))
      expect(response.events[0].carrier_status_code).to(eq(expected_response[:events][0][:carrier_status_code]))
      expect(response.events[0].carrier_status_description).to(eq(expected_response[:events][0][:carrier_status_description]))
      expect(response.events[0].latitude).to(eq(expected_response[:events][0][:latitude]))
      expect(response.events[0].longitude).to(eq(expected_response[:events][0][:longitude]))
    end
  end

  context "Start Tracking a Package" do
    it "should Start Tracking a Package" do
      params = {}
      expected_response = {}

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.tracking.root}/start"
      ).with(body: params).to_return(status: 204, body: expected_response.to_json)

      response = tracking.start_tracking_package(params: params)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end

  context "Stop Tracking a Package" do
    it "should stop Tracking a Package" do
      params = {}
      expected_response = {}

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.tracking.root}/stop"
      ).with(body: params).to_return(status: 204, body: expected_response.to_json)

      response = tracking.stop_tracking_package(params: params)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end
end
