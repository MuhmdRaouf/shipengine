# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class Warehouses
      def initialize
        @client = ShipEngine::Client.new
      end

      def list_warehouses(params: {})
        response = @client.get(
          path: ShipEngine::Constants::PATHS.v1.warehouses.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def create_warehouse(params: {})
        response = @client.post(
          path: ShipEngine::Constants::PATHS.v1.warehouses.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def warehouse_by_id(warehouse_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.warehouses.root}/#{warehouse_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def update_warehouse_by_id(warehouse_id:, params: {})
        response = @client.put(
          path: "#{ShipEngine::Constants::PATHS.v1.warehouses.root}/#{warehouse_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def delete_warehouse_by_id(warehouse_id:, params: {})
        response = @client.delete(
          path: "#{ShipEngine::Constants::PATHS.v1.warehouses.root}/#{warehouse_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end
    end
  end
end
