# frozen_string_literal: true

require "hashie"

module ShipEngine
  module Domain
    class Tags
      def initialize
        @client = ShipEngine::Client.new
      end

      def list_tags(params: {})
        response = @client.get(
          path: ShipEngine::Constants::PATHS.v1.tags.root,
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def create_tag(tag_name:, params: {})
        response = @client.post(
          path: "#{ShipEngine::Constants::PATHS.v1.tags.root}/#{tag_name}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def delete_tag(tag_name:, params: {})
        response = @client.delete(
          path: "#{ShipEngine::Constants::PATHS.v1.tags.root}/#{tag_name}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end

      def update_tag(tag_name:, new_tag_name:, params: {})
        response = @client.put(
          path: "#{ShipEngine::Constants::PATHS.v1.tags.root}/#{tag_name}/#{new_tag_name}",
          options: params
        )

        Hashie::Mash.new(response.body)
      end
    end
  end
end
