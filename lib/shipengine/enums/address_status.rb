# frozen_string_literal: true

module ShipEngine
  module Enums
    module AddressStatus
      #
      # Address validation was not validated against the database because pre-validation failed.
      #
      UNVERIFIED = "unverified"

      #
      # Address was successfully verified.
      #
      VERIFIED = "verified"

      #
      # The address was validated, but the address should be double checked.
      #
      WARNING = "warning"

      #
      # The address could not be validated with any degree of certainty against the database.
      #
      ERROR = "error"

      ALL = [
        UNVERIFIED,
        VERIFIED,
        WARNING,
        ERROR,
      ].freeze
    end
  end
end
