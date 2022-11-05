# frozen_string_literal: true

require "shipengine/client"
require "shipengine/configuration"
require "shipengine/constants"
require "shipengine/domains"
require "shipengine/enums"
require "shipengine/exceptions"
require "shipengine/utils"
require "shipengine/version"

module ShipEngine
  # Configures global settings for ShipEngine
  #   ShipEngine.configure do |config|
  #     config.api_key = 'api-key'
  #   end
  class << self
    def configure
      yield configs if block_given?
    end

    def configs
      @configs ||= Configuration.new
    end
  end
end
