# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class Labels
      def initialize
        @client = ShipEngine::Client.new
      end

      def list_labels(params: {})
        response = @client.get(
          path: ShipEngine::Constants::PATHS.v1.labels.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def purchase_label(params: {})
        response = @client.post(
          path: ShipEngine::Constants::PATHS.v1.labels.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def label_by_external_shipment_id(shipment_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.labels.label_by_external_shipment_id}/#{shipment_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def purchase_label_with_rate_id(rate_id:, params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.v1.labels.purchase_label_with_rate_id}/#{rate_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def purchase_label_with_shipment_id(shipment_id:, params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.v1.labels.purchase_label_with_shipment_id}/#{shipment_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def label_by_id(label_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.labels.root}/#{label_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def create_return_label(label_id:, params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.v1.labels.root}/#{label_id}/return",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def label_tracking_information(label_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.labels.root}/#{label_id}/track",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def void_label_by_id(label_id:, params: {})
        response = @client.put(
          path: "#{ShipEngine::Constants::PATHS.v1.labels.root}/#{label_id}/void",
          options: params
        )

        Hashie::Mash.new(response.body)
      end
    end
  end
end
