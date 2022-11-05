# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class Addresses
      def initialize
        @client = ShipEngine::Client.new
      end

      def parse_address(address)
        response = @client.post(
          path: ShipEngine::Constants::PATHS.v1.addresses.parse_address,
          options: address
        )

        Hashie::Mash.new(response.body)
      end

      def validate_address(addresses)
        clean_addresses = addresses.map(&:compact)

        response = @client.post(
          path: ShipEngine::Constants::PATHS.v1.addresses.validate_address,
          options: clean_addresses
        )

        response.body.map { |result| Hashie::Mash.new(result) }
      end
    end
  end
end
