# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class Manifests
      def initialize
        @client = ShipEngine::Client.new
      end

      def list_manifests(params: {})
        response = @client.get(
          path: ShipEngine::Constants::PATHS.v1.manifests.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def create_manifest(params: {})
        response = @client.post(
          path: ShipEngine::Constants::PATHS.v1.manifests.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def manifest_by_id(manifest_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.manifests.root}/#{manifest_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def manifest_request_by_id(manifest_request_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.manifests.manifest_request}/#{manifest_request_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end
    end
  end
end
