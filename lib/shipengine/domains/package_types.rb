# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class PackageTypes
      def initialize
        @client = ShipEngine::Client.new
      end

      def list_custom_package_types(params: {})
        response = @client.get(
          path: ShipEngine::Constants::PATHS.v1.package_types.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def create_custom_package_types(params: {})
        response = @client.post(
          path: ShipEngine::Constants::PATHS.v1.package_types.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def custom_package_types_by_id(package_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.package_types.root}/#{package_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def update_custom_package_types_by_id(package_id:, params: {})
        response = @client.put(
          path: "#{ShipEngine::Constants::PATHS.v1.package_types.root}/#{package_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def delete_custom_package_types_by_id(package_id:, params: {})
        response = @client.delete(
          path: "#{ShipEngine::Constants::PATHS.v1.package_types.root}/#{package_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end
    end
  end
end
