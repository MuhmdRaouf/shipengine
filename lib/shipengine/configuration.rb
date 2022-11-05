# frozen_string_literal: true

module ShipEngine
  class Configuration
    attr_accessor :api_key, :retries, :base_url, :timeout, :page_size

    def initialize(api_key: nil, retries: nil, timeout: nil, page_size: nil, base_url: nil)
      @api_key = api_key || ShipEngine::Constants::API_KEY
      @base_url = base_url || ShipEngine::Constants::PROD_URL
      @retries = retries || ShipEngine::Constants::RETRIES
      @timeout = timeout || ShipEngine::Constants::TIMEOUT
      @page_size = page_size || ShipEngine::Constants::PAGE_SIZE
      validate
    end

    private

    def validate
      ShipEngine::Utils::Validate.str("A ShipEngine API key", @api_key)
      ShipEngine::Utils::Validate.str("Base URL", @base_url)
      ShipEngine::Utils::Validate.non_neg_int("Retries", @retries)
      ShipEngine::Utils::Validate.positive_int("Timeout", @timeout)
      ShipEngine::Utils::Validate.positive_int("Page size", @page_size)
    end
  end
end
