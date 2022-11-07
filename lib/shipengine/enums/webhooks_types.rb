# frozen_string_literal: true

module ShipEngine
  module Enums
    module WebhooksTypes
      ##
      # Batch completed
      # #/
      API_BATCH = "batch"

      ##
      # Shipment rate updated
      # #/
      API_RATE = "rate"

      ##
      # Any tracking event
      # #/
      API_TRACK = "track"

      ##
      # Carrier connected
      # #/
      API_CARRIER_CONNECTED = "carrier_connected"

      ##
      # Sales Orders imported (Beta)
      # #/
      API_SALES_ORDERS_IMPORTED = "sales_orders_imported"

      ##
      # Order Source refresh complete (Beta)
      # #/
      API_ORDER_SOURCE_REFRESH_COMPLETE = "order_source_refresh_complete"

      ##
      # A requested report is ready
      # #/
      API_REPORT_COMPLETE = "report_complete"

      ALL = [
        API_BATCH,
        API_RATE,
        API_TRACK,
        API_CARRIER_CONNECTED,
        API_SALES_ORDERS_IMPORTED,
        API_ORDER_SOURCE_REFRESH_COMPLETE,
        API_REPORT_COMPLETE,
      ].freeze
    end
  end
end
