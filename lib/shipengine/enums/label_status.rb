# frozen_string_literal: true

module ShipEngine
  module Enums
    module LabelStatus
      PROCESSING = "processing"

      COMPLETED = "completed"

      ERROR = "error"

      VOIDED = "voided"

      ALL = [
        PROCESSING,
        COMPLETED,
        ERROR,
        VOIDED,
      ].freeze
    end
  end
end
