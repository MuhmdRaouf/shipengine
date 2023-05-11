# frozen_string_literal: true

module  ShipEngine
  module Enums
    module WebhooksTypes
      ##
      # Batch completed
      # #/
      API_BATCH = "batch"
      API_BATCH_RESOURCE_TYPE = "API_BATCH"

      ##
      # Shipment rate updated
      # #/
      API_RATE = "rate"
      API_RATE_RESOURCE_TYPE = "API_RATE"

      ##
      # Any tracking event
      # #/
      API_TRACK = "track"
      API_TRACK_RESOURCE_TYPE = "API_TRACK"

      ##
      # Carrier connected
      # #/
      API_CARRIER_CONNECTED = "carrier_connected"
      API_CARRIER_CONNECTED_RESOURCE_TYPE = "API_CARRIER_CONNECTED"

      ##
      # Sales Orders imported (Beta)
      # #/
      API_SALES_ORDERS_IMPORTED = "sales_orders_imported"
      API_SALES_ORDERS_IMPORTED_RESOURCE_TYPE = "API_SALES_ORDERS_IMPORTED"

      ##
      # Order Source refresh complete (Beta)
      # #/
      API_ORDER_SOURCE_REFRESH_COMPLETE = "order_source_refresh_complete"
      API_ORDER_SOURCE_REFRESH_COMPLETE_RESOURCE_TYPE = "API_ORDER_SOURCE_REFRESH_COMPLETE"

      ##
      # A requested report is ready
      # #/
      API_REPORT_COMPLETE = "report_complete"
      API_REPORT_COMPLETE_RESOURCE_TYPE = "API_REPORT_COMPLETE"

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
