# frozen_string_literal: true

module ShipEngine
  module Errors
    ##
    ##  This class has the ability to return a specific error source.
    ##
    ## @see https://www.shipengine.com/docs/errors/codes/#error-source
    # #/
    class ErrorSource
      # @param [Symbol | String] key
      # @return [String] error type
      def self.get(key)
        @sources[key.upcase.to_sym] || @sources[:SHIPENGINE]
      end

      @sources = {
        ##
        #	The error is from ShipEngine. If you have any questions or require support, please contact us
        # #/
        SHIPENGINE: "shipengine",

        ##
        #	The error came from a shipping carrier (such as UPS, FedEx, DHL, etc).
        # ShipEngine support may be able to help clarify the error for you,
        # but if the problem is with your carrier account, then you will need to contact them directly.
        # #/
        CARRIER: "carrier",

        ##
        #	The error came from an order source (such as Shopify, Ebay, WalMart, etc).
        # ShipEngine support may be able to help clarify the error for you,
        # but if the problem is with your seller account, then you will need to contact them directly.
        # #/
        ORDER_SOURCE: "order_source",
      }.freeze
    end
  end
end
