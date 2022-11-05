# frozen_string_literal: true

require "faraday"

module ShipEngine
  module FaradayMiddleware
    class RaiseHttpException < Faraday::Middleware
      def call(env)
        @app.call(env).on_complete do |response|
          status_code = response[:status].to_i
          if [400, 401, 404, 500, 502, 503, 504].include?(status_code)
            raise ShipEngine::Exceptions::ShipEngineError.new(
              message: error_body(response[:body]),
              source: error_source(response[:body]),
              type: error_type(response[:body]),
              code: error_code(response[:body]),
              url: response[:url].to_s
            )
          elsif [429].include?(status_code)
            raise ShipEngine::Exceptions::RateLimitError.new(
              retries: env.request_headers["Retries"].to_i,
              source: error_source(response[:body])
            )
          end
        end
      end

      private

      def error_message_400(response)
        "#{response[:method].to_s.upcase} #{response[:url]}: #{response[:status]}#{error_body(response[:body])}"
      end

      def error_body(body)
        if !body.nil? && !body.empty? && body.is_a?(String)
          body = JSON.parse(body)
        end

        if body.nil?
          nil
        elsif body["errors"] && !body["errors"].empty?
          body["errors"][0]["message"]
        end
      end

      def error_source(body)
        if !body.nil? && !body.empty? && body.is_a?(String)
          body = JSON.parse(body)
        end

        if body.nil?
          nil
        elsif body["errors"] && !body["errors"].empty?
          body["errors"][0]["error_source"]
        end
      end

      def error_type(body)
        if !body.nil? && !body.empty? && body.is_a?(String)
          body = JSON.parse(body)
        end

        if body.nil?
          nil
        elsif body["errors"] && !body["errors"].empty?
          body["errors"][0]["error_type"]
        end
      end

      def error_code(body)
        if !body.nil? && !body.empty? && body.is_a?(String)
          body = JSON.parse(body)
        end

        if body.nil?
          nil
        elsif body["errors"] && !body["errors"].empty?
          body["errors"][0]["error_code"]
        end
      end
    end
  end
end
