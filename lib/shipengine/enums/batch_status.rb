# frozen_string_literal: true

module ShipEngine
  module Enums
    module BatchStatus
      OPEN = "open"

      QUEUED = "queued"

      PROCESSING = "processing"

      COMPLETED = "completed"

      COMPLETED_WITH_ERRORS = "completed_with_errors"

      ARCHIVED = "archived"

      NOTIFYING = "notifying"

      INVALID = "invalid"

      ALL = [
        OPEN,
        QUEUED,
        PROCESSING,
        COMPLETED,
        COMPLETED_WITH_ERRORS,
        ARCHIVED,
        NOTIFYING,
        INVALID,
      ].freeze
    end
  end
end
