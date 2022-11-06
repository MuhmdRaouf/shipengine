# frozen_string_literal: true

module ShipEngine
  module Enums
    module ValidateAddress
      NO_VALIDATION = "no_validation"

      VALIDATE_ONLY = "validate_only"

      VALIDATE_AND_CLEAN = "validate_and_clean"

      ALL = [
        NO_VALIDATION,
        VALIDATE_ONLY,
        VALIDATE_AND_CLEAN,
      ].freeze
    end
  end
end
