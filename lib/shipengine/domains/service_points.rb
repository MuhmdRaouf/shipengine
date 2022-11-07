# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class ServicePoints
      def initialize
        @client = ShipEngine::Client.new
      end

      def list_service_points(params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.v1.service_points.root}/list",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def service_point_by_id(carrier_code:, country_code:, service_point_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.service_points.root}/#{carrier_code}/#{country_code}/#{service_point_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end
    end
  end
end
