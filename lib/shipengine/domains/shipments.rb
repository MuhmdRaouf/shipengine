# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class Shipments
      def initialize
        @client = ShipEngine::Client.new
      end

      def list_shipments(params: {})
        response = @client.get(
          path: ShipEngine::Constants::PATHS.v1.shipments.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def create_shipments(params: {})
        response = @client.post(
          path: ShipEngine::Constants::PATHS.v1.shipments.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def shipment_by_external_id(external_shipment_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.shipments.shipment_by_external_id}/#{external_shipment_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def parse_shipping_info(params: {})
        response = @client.put(
          path: ShipEngine::Constants::PATHS.v1.shipments.parse_shipping_info,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def shipment_by_id(shipment_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.shipments.root}/#{shipment_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def update_shipment_by_id(shipment_id:, params: {})
        response = @client.put(
          path: "#{ShipEngine::Constants::PATHS.v1.shipments.root}/#{shipment_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def cancel_shipment_by_id(shipment_id:, params: {})
        response = @client.put(
          path: "#{ShipEngine::Constants::PATHS.v1.shipments.root}/#{shipment_id}/cancel",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def shipment_rates(shipment_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.shipments.root}/#{shipment_id}/rates",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def add_tag_to_shipment(shipment_id:, tag_name:, params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.v1.shipments.root}/#{shipment_id}/tags/#{tag_name}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def remove_tag_to_shipment(shipment_id:, tag_name:, params: {})
        response = @client.delete(
          path: "#{ShipEngine::Constants::PATHS.v1.shipments.root}/#{shipment_id}/tags/#{tag_name}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end
    end
  end
end
