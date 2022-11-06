# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class Shipsurance
      def initialize
        @client = ShipEngine::Client.new
      end

      def disconnect_shipsurance_account(params: {})
        response = @client.delete(
          path: ShipEngine::Constants::PATHS.v1.shipsurance.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def connect_shipsurance_account(params: {})
        response = @client.post(
          path: ShipEngine::Constants::PATHS.v1.shipsurance.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def add_funds_to_insurance(params: {})
        response = @client.patch(
          path: ShipEngine::Constants::PATHS.v1.shipsurance.add_funds,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def get_insurance_funds_balance(params: {})
        response = @client.get(
          path: ShipEngine::Constants::PATHS.v1.shipsurance.balance,
          options: params
        )

        Hashie::Mash.new(response.body)
      end
    end
  end
end
