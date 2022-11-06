# frozen_string_literal: true

require "faraday_middleware"
require "shipengine/faraday/raise_http_exception"

# frozen_string_literal: true
module ShipEngine
  class Client
    # Perform an HTTP GET request
    def get(path:, options: {})
      request(method: :get, path: path, options: options)
    end

    # Perform an HTTP POST request
    def post(path:, options: {})
      request(method: :post, path: path, options: options)
    end

    # Perform an HTTP PUT request
    def put(path:, options: {})
      request(method: :put, path: path, options: options)
    end

    # Perform an HTTP DELETE request
    def delete(path:, options: {})
      request(method: :delete, path: path, options: options)
    end

    private

    def retry_config
      {
        max: ShipEngine.configs.retries,
        # even though this seems self-evident, this field is necessary for Retry-After to be respected.
        retry_statuses: [429],
        # :post is not a "retry_attempt-able request by default"
        methods: Faraday::Request::Retry::IDEMPOTENT_METHODS + [:post],
        exceptions: [ShipEngine::Exceptions::RateLimitError],
        retry_block: proc { |env| env.request_headers["Retries"] = ShipEngine.configs.retries.to_s },
      }
    end

    def create_connection
      Faraday.new(url: ShipEngine.configs.base_url) do |conn|
        conn.headers = {
          "API-Key" => ShipEngine.configs.api_key, "Accept" => "application/json", "Content-Type" => "application/json",
        }
        conn.options.timeout = ShipEngine.configs.timeout / 1000
        conn.request(:json) # auto-coerce bodies to json
        conn.request(:retry, retry_config)
        conn.use(ShipEngine::FaradayMiddleware::RaiseHttpException)
        conn.response(:json)
      end
    end

    def request(method:, path:, options:)
      create_connection.send(method) do |request|
        if [:get, :delete].include?(method)
          request.url(path, options)
        elsif [:post, :put].include?(method)
          request.path = path
          request.body = options if !options.nil? && !options.empty?
        end
      end
    end
  end
end
