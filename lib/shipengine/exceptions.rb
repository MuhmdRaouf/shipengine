# frozen_string_literal: true

require "shipengine/exceptions/error_code"
require "shipengine/exceptions/error_type"

module ShipEngine
  module Exceptions
    DEFAULT_SOURCE = "shipengine"

    # 400 error, or other "user exceptions"
    class ShipEngineError < StandardError
      # message is inherited
      attr_reader :source, :type, :code, :url

      def initialize(message:, source:, type:, code:, url: nil)
        code = ShipEngine::Exceptions::ErrorCode.get(code) if code.is_a?(String)
        super(message)
        @source = source || DEFAULT_SOURCE
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
          code: ShipEngine::Exceptions::ErrorCode.get(:INVALID_FIELD_VALUE)
        )
      end

      def required_error(field_name:)
        ValidationError.new(
          message: "#{field_name} must be specified.",
          code: ShipEngine::Exceptions::ErrorCode.get(:FIELD_VALUE_REQUIRED)
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
          type: ShipEngine::Exceptions::ErrorType.get(:VALIDATION),
        )
      end
    end

    class SystemError < ShipEngineError
      def initialize(message:, code:, source: nil, url: nil)
        super(
          url: url,
          code: code,
          source: source,
          message: message,
          type: ShipEngine::Exceptions::ErrorType.get(:SYSTEM),
        )
      end
    end

    class RateLimitError < SystemError
      attr_reader :retries

      def initialize(retries: nil, message: "You have exceeded the rate limit.", source: nil)
        super(
          message: message,
          code: ShipEngine::Exceptions::ErrorCode.get(:RATE_LIMIT_EXCEEDED),
          source: source,
          url: URI("https://www.shipengine.com/docs/rate-limits"),
        )
        @retries = retries
      end
    end
  end
end
