# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class Tracking
      def initialize
        @client = ShipEngine::Client.new
      end

      def tracking_information(params: {})
        response = @client.get(
          path: ShipEngine::Constants::PATHS.v1.tracking.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def start_tracking_package(params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.v1.tracking.root}/start",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def stop_tracking_package(params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.v1.tracking.root}/stop",
          options: params
        )

        Hashie::Mash.new(response.body)
      end
    end
  end
end
