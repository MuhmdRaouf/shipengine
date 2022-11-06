# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class CarriersAccounts
      def initialize
        @client = ShipEngine::Client.new
      end

      def connect_carrier_account(carrier_name:, params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.v1.carriers_accounts.root}/#{carrier_name}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def disconnect_carrier_account(carrier_name:, carrier_id:, params: {})
        response = @client.delete(
          path: "#{ShipEngine::Constants::PATHS.v1.carriers_accounts.root}/#{carrier_name}/#{carrier_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def carrier_settings(carrier_name:, carrier_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.carriers_accounts.root}/#{carrier_name}/#{carrier_id}/settings",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def update_carrier_settings(carrier_name:, carrier_id:, params: {})
        response = @client.put(
          path: "#{ShipEngine::Constants::PATHS.v1.carriers_accounts.root}/#{carrier_name}/#{carrier_id}/settings",
          options: params
        )

        Hashie::Mash.new(response.body)
      end
    end
  end
end
