# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class Rates
      def initialize
        @client = ShipEngine::Client.new
      end

      def shipping_rates(params: {})
        response = @client.post(
          path: ShipEngine::Constants::PATHS.v1.rates.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def bulk_rates(params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.v1.rates.root}/bulk",
          options: params
        )

        response.body.map { |rate| Hashie::Mash.new(rate) }
      end

      def estimate_rates(params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.v1.rates.root}/estimate",
          options: params
        )

        response.body.map { |rate| Hashie::Mash.new(rate) }
      end

      def rate_by_id(rate_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.rates.root}/#{rate_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end
    end
  end
end
