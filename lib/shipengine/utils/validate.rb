# frozen_string_literal: true

module ShipEngine
  module Utils
    module Validate
      class << self
        def not_nil(field, value)
          return unless value.nil?

          raise ShipEngine::Exceptions.required_error(field_name: field)
        end

        def not_nil_or_empty_str(field, value)
          not_nil(field, value)
          return unless value == ""

          raise ShipEngine::Exceptions.required_error(field_name: field)
        end

        def str(field, value)
          not_nil(field, value)
          return if value.is_a?(String)

          raise ShipEngine::Exceptions.invalid_field_value_error(message: "#{field} must be a String.")
        end

        def non_empty_str(field, value)
          str(field, value)
          return unless value.empty?

          raise ShipEngine::Exceptions.invalid_field_value_error(message: "#{field} cannot be empty.")
        end

        def non_whitespace_str(field, value)
          str(field, value)
          return unless value.strip.empty?

          raise ShipEngine::Exceptions.invalid_field_value_error(message: "#{field} cannot be all whitespace.")
        end

        def hash(field, value)
          not_nil(field, value)
          return if value.is_a?(Hash)

          raise ShipEngine::Exceptions.invalid_field_value_error(message: "#{field} must be Hash.")
        end

        def bool(field, value)
          not_nil(field, value)
          return if [true, false].include?(value)

          raise ShipEngine::Exceptions.invalid_field_value_error(message: "#{field} must be a Boolean.")
        end

        def number(field, value)
          not_nil(field, value)
          return if value.is_a?(Numeric)

          raise ShipEngine::Exceptions.invalid_field_value_error(message: "#{field} must be Numeric.")
        end

        def int(field, value)
          number(field, value)
          return if value.to_i == value

          raise ShipEngine::Exceptions.invalid_field_value_error(message: "#{field} must be a whole number.")
        end

        def non_neg_int(field, value)
          int(field, value)
          return if value >= 0

          raise ShipEngine::Exceptions.invalid_field_value_error(message: "#{field} must be zero or greater.")
        end

        def positive_int(field, value)
          int(field, value)
          return if value.positive?

          raise ShipEngine::Exceptions.invalid_field_value_error(message: "#{field} must be greater than zero.")
        end

        def array(field, value)
          not_nil(field, value)

          return if value.is_a?(Array)

          raise ShipEngine::Exceptions.invalid_field_value_error(message: "#{field} must be an Array.")
        end

        def array_of_str(field, value)
          array(field, value)
          value.each do |v|
            next if v.is_a?(String)

            raise ShipEngine::Exceptions.invalid_field_value_error(message: "#{field} must be an Array of Strings.")
          end
        end
      end
    end
  end
end
