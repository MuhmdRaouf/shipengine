# frozen_string_literal: true

module ShipEngine
  module Enums
    module MessageStatus
      #
      # Info messages will describe the partial or complete level of accuracy available for the Address Validation.
      #
      INFO = "info"

      #
      # Warning messages will usually consist of significant changes* or
      # additions to the data that was provided in the request
      #
      WARNING = "warning"

      #
      # Error messages will usually describe a portion of the data sent in the request,
      # that could not be validated with any measure of accuracy
      #
      ERROR = "error"

      ALL = [
        INFO,
        WARNING,
        ERROR,
      ].freeze
    end
  end
end
