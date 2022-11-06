# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class Batches
      def initialize
        @client = ShipEngine::Client.new
      end

      def list_batches(params: {})
        response = @client.get(
          path: ShipEngine::Constants::PATHS.v1.batches.path,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def create_batch(params:)
        response = @client.post(
          path: ShipEngine::Constants::PATHS.v1.batches.path,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def batch_by_external_id(external_batch_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.batches.get_batch_by_external_id}/#{external_batch_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def delete_batch_by_id(batch_id:, params: {})
        response = @client.delete(
          path: "#{ShipEngine::Constants::PATHS.v1.batches.path}/#{batch_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def batch_by_id(batch_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.batches.path}/#{batch_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def update_batch_by_id(batch_id:, params: {})
        response = @client.put(
          path: "#{ShipEngine::Constants::PATHS.v1.batches.path}/#{batch_id}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def add_to_batch(batch_id:, params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.v1.batches.path}/#{batch_id}/add",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def batch_errors(batch_id:, params: {})
        response = @client.get(
          path: "#{ShipEngine::Constants::PATHS.v1.batches.path}/#{batch_id}/errors",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def process_batch_id_labels(batch_id:, params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.v1.batches.path}/#{batch_id}/process/labels",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def remove_from_batch(batch_id:, params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.v1.batches.path}/#{batch_id}/remove",
          options: params
        )

        Hashie::Mash.new(response.body)
      end
    end
  end
end
