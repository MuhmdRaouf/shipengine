# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class PackagePickups
      def initialize
        @client = ShipEngine::Client.new
      end

      def list_package_pickups(params: {})
        response = @client.get(
          path: ShipEngine::Constants::PATHS.v1.package_pickups.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def schedule_pickup(params: {})
        response = @client.post(
          path: ShipEngine::Constants::PATHS.v1.package_pickups.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def pickup_by_id(pickup_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.package_pickups.root}/#{pickup_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def delete_schedule_pickup(pickup_id:, params: {})
        response = @client.delete(
          path: "#{ShipEngine::Constants::PATHS.v1.package_pickups.root}/#{pickup_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end
    end
  end
end
