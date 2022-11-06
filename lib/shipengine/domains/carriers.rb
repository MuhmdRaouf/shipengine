# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class Carriers
      def initialize
        @client = ShipEngine::Client.new
      end

      def list_carriers(params: {})
        response = @client.get(
          path: ShipEngine::Constants::PATHS.v1.carriers.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def carrier_by_id(carrier_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.carriers.root}/#{carrier_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def add_funds_to_carrier(carrier_id:, params: {})
        response = @client.put(
          path: "#{ShipEngine::Constants::PATHS.v1.carriers.root}/#{carrier_id}/add_funds",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def carrier_options(carrier_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.carriers.root}/#{carrier_id}/options",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def list_carrier_package_types(carrier_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.carriers.root}/#{carrier_id}/packages",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def list_carrier_services(carrier_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.carriers.root}/#{carrier_id}/services",
          options: params
        )

        Hashie::Mash.new(response.body)
      end
    end
  end
end
