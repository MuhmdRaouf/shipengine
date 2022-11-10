# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class Webhooks
      def initialize
        @client = ShipEngine::Client.new
      end

      def list_webhooks(params: {})
        response = @client.get(
          path: ShipEngine::Constants::PATHS.v1.webhooks.root,
          options: params
        )

        response.body.map { |webhook| Hashie::Mash.new(webhook) }
      end

      def create_webhook(params: {})
        response = @client.post(
          path: ShipEngine::Constants::PATHS.v1.webhooks.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def webhook_by_id(webhook_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.webhooks.root}/#{webhook_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def update_webhook_by_id(webhook_id:, params: {})
        response = @client.put(
          path: "#{ShipEngine::Constants::PATHS.v1.webhooks.root}/#{webhook_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def delete_webhook_by_id(webhook_id:, params: {})
        response = @client.delete(
          path: "#{ShipEngine::Constants::PATHS.v1.webhooks.root}/#{webhook_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def process_webhook(resource_url:, params: {})
        response = @client.get(
          path: resource_url,
          options: params
        )

        Hashie::Mash.new(response.body)
      end
    end
  end
end
