# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class Tokens
      def initialize
        @client = ShipEngine::Client.new
      end

      def ephemeral_token(params: {})
        response = @client.post(
          path: ShipEngine::Constants::PATHS.v1.tokens.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end
    end
  end
end
