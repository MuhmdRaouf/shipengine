# frozen_string_literal: true

RSpec.describe(ShipEngine::Client) do
  let(:addresses) { ShipEngine::Domain::Addresses.new }
  let(:params) do
    [{
      address_line1: "500 Server Error",
      city_locality: "Boston",
      state_province: "MA",
      postal_code: "01152",
      country: "US",
    }]
  end

  let(:expected_params) do
    {
      request_id: "3f592c95-9574-49ba-86a0-bc49771834f9",
      errors: [{
        error_source: "shipengine",
        error_type: "validation",
        error_code: "request_body_required",
        message: "Request body cannot be empty.",
      }],
    }
  end

  before(:each) do
    WebMock.reset!
  end

  context ShipEngine::Exceptions do
    it "should handle status code 400" do
      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.addresses.validate_address}"
      ).with(body: params).to_return(status: 400, body: expected_params.to_json)

      expect do
        addresses.validate_address(params)
      end.to(raise_error(ShipEngine::Exceptions::ShipEngineError))
      assert_requested(request, times: 1)
    end

    it "should handle status code 401" do
      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.addresses.validate_address}"
      ).with(body: params).to_return(status: 401, body: expected_params.to_json)

      expect do
        addresses.validate_address(params)
      end.to(raise_error(ShipEngine::Exceptions::ShipEngineError))
      assert_requested(request, times: 1)
    end

    it "should handle status code 404" do
      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.addresses.validate_address}"
      ).with(body: params).to_return(status: 404, body: expected_params.to_json)

      expect do
        addresses.validate_address(params)
      end.to(raise_error(ShipEngine::Exceptions::ShipEngineError))
      assert_requested(request, times: 1)
    end

    it "should handle status code 500" do
      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.addresses.validate_address}"
      ).with(body: params).to_return(status: 500, body: expected_params.to_json)

      expect do
        addresses.validate_address(params)
      end.to(raise_error(ShipEngine::Exceptions::ShipEngineError))
      assert_requested(request, times: 1)
    end

    it "should handle status code 502" do
      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.addresses.validate_address}"
      ).with(body: params).to_return(status: 502, body: expected_params.to_json)

      expect do
        addresses.validate_address(params)
      end.to(raise_error(ShipEngine::Exceptions::ShipEngineError))
      assert_requested(request, times: 1)
    end

    it "should handle status code 503" do
      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.addresses.validate_address}"
      ).with(body: params).to_return(status: 503, body: expected_params.to_json)

      expect do
        addresses.validate_address(params)
      end.to(raise_error(ShipEngine::Exceptions::ShipEngineError))
      assert_requested(request, times: 1)
    end

    it "should handle status code 504" do
      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.addresses.validate_address}"
      ).with(body: params).to_return(status: 504, body: expected_params.to_json)

      expect do
        addresses.validate_address(params)
      end.to(raise_error(ShipEngine::Exceptions::ShipEngineError))
      assert_requested(request, times: 1)
    end

    it "should handle status code 429" do
      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.addresses.validate_address}"
      ).with(body: params).to_return(status: 429, body: expected_params.to_json)

      expect do
        addresses.validate_address(params)
      end.to(raise_error(ShipEngine::Exceptions::RateLimitError))
      assert_requested(request, times: 2)
    end
  end
end
