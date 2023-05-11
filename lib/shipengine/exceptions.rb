# frozen_string_literal: true

require "shipengine/errors/error_code"
require "shipengine/errors/error_source"
require "shipengine/errors/error_type"

module ShipEngine
  module Exceptions
    class ShipEngineError < StandardError
      # message is inherited
      attr_reader :source, :type, :code, :request_id, :url

      def initialize(message:, source:, type:, code:, request_id: nil, url: nil)
        code = ShipEngine::Errors::ErrorCode.get(code) if code.is_a?(String)
        source = ShipEngine::Errors::ErrorSource.get(source) if source.is_a?(String)
        super(message)
        @request_id = request_id
        @source = source
        @type = type
        @code = code
        @url = url
      end
    end

    class << self
      # only create custom errors for error "types" (which encompass codes). Prefer to use generic ShipEngine errors.
      def invalid_field_value_error(message:)
        ValidationError.new(
          message: message,
          code: ShipEngine::Errors::ErrorCode.get(:INVALID_FIELD_VALUE)
        )
      end

      def required_error(field_name:)
        ValidationError.new(
          message: "#{field_name} must be specified.",
          code: ShipEngine::Errors::ErrorCode.get(:FIELD_VALUE_REQUIRED)
        )
      end
    end

    # 400 error, or other "user exceptions"
    class ValidationError < ShipEngineError
      def initialize(message:, code:, source: nil)
        super(
          code: code,
          source: source,
          message: message,
          type: ShipEngine::Errors::ErrorType.get(:VALIDATION),
          )
      end
    end

    class SystemError < ShipEngineError
      def initialize(message:, code:, source: nil, url: nil, request_id: nil)
        super(
          url: url,
          code: code,
          source: source,
          message: message,
          request_id: request_id,
          type: ShipEngine::Errors::ErrorType.get(:SYSTEM),
          )
      end
    end

    class RateLimitError < SystemError
      attr_reader :retries

      def initialize(retries: nil, message: "You have exceeded the rate limit.", source: nil, request_id: nil)
        super(
          message: message,
          code: ShipEngine::Errors::ErrorCode.get(:RATE_LIMIT_EXCEEDED),
          source: source,
          request_id: request_id,
          url: URI("https://www.shipengine.com/docs/rate-limits"),
          )
        @retries = retries
      end
    end
  end
end
