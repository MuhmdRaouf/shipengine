# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::Rates) do
  let(:rates) { ShipEngine::Domain::Rates.new }

  context "Get Shipping Rates" do
    it "should get shipping rates" do
      params = {
        shipment_id: "se-28529731",
        rate_options: {
          carrier_ids: ["se-28529731"],
          package_types: ["string"],
          service_codes: ["string"],
          calculate_tax_amount: true,
          preferred_currency: "string",
          is_return: true,
        },
      }
      expected_response = {
        shipment_id: "se-28529731",
        carrier_id: "se-28529731",
        service_code: "usps_first_class_mail",
        external_order_id: "string",
        items: [],
        tax_identifiers: [
          {
            taxable_entity_type: "shipper",
            identifier_type: "vat",
            issuing_authority: "string",
            value: "string",
          },
        ],
        external_shipment_id: "string",
        shipment_number: "string",
        ship_date: "2018-09-23T00:00:00.000Z",
        created_at: "2018-09-23T15:00:00.000Z",
        modified_at: "2018-09-23T15:00:00.000Z",
        shipment_status: "pending",
        ship_to: {
          name: "John Doe",
          phone: "+1 204-253-9411 ext. 123",
          company_name: "The Home Depot",
          address_line1: "1999 Bishop Grandin Blvd.",
          address_line2: "Unit 408",
          address_line3: "Building #7",
          city_locality: "Winnipeg",
          state_province: "Manitoba",
          postal_code: "78756-3717",
          country_code: "CA",
          address_residential_indicator: "no",
        },
        ship_from: {
          name: "John Doe",
          phone: "+1 204-253-9411 ext. 123",
          company_name: "The Home Depot",
          address_line1: "1999 Bishop Grandin Blvd.",
          address_line2: "Unit 408",
          address_line3: "Building #7",
          city_locality: "Winnipeg",
          state_province: "Manitoba",
          postal_code: "78756-3717",
          country_code: "CA",
          address_residential_indicator: "no",
        },
        warehouse_id: "se-28529731",
        return_to: {
          name: "John Doe",
          phone: "+1 204-253-9411 ext. 123",
          company_name: "The Home Depot",
          address_line1: "1999 Bishop Grandin Blvd.",
          address_line2: "Unit 408",
          address_line3: "Building #7",
          city_locality: "Winnipeg",
          state_province: "Manitoba",
          postal_code: "78756-3717",
          country_code: "CA",
          address_residential_indicator: "no",
        },
        confirmation: "none",
        customs: {
          contents: "merchandise",
          non_delivery: "return_to_sender",
          customs_items: [],
        },
        advanced_options: {
          bill_to_account: nil,
          bill_to_country_code: "CA",
          bill_to_party: "recipient",
          bill_to_postal_code: nil,
          contains_alcohol: false,
          delivered_duty_paid: false,
          dry_ice: false,
          dry_ice_weight: {
            value: 0,
            unit: "pound",
          },
          non_machinable: false,
          saturday_delivery: false,
          fedex_freight: {
            shipper_load_and_count: "string",
            booking_confirmation: "string",
          },
          use_ups_ground_freight_pricing: nil,
          freight_class: 77.5,
          custom_field1: nil,
          custom_field2: nil,
          custom_field3: nil,
          origin_type: "pickup",
          shipper_release: nil,
          collect_on_delivery: {
            payment_type: "any",
            payment_amount: {
              currency: "string",
              amount: 0,
            },
          },
        },
        origin_type: "pickup",
        insurance_provider: "none",
        tags: [],
        order_source_code: "amazon_ca",
        packages: [
          {
            package_id: 0,
            package_code: "small_flat_rate_box",
            weight: {
              value: 0,
              unit: "pound",
            },
            dimensions: {
              unit: "inch",
              length: 0,
              width: 0,
              height: 0,
            },
            insured_value: {
              "0": {
                currency: "usd",
                amount: 0,
              },
              currency: "string",
              amount: 0,
            },
            tracking_number: "1Z932R800392060079",
            label_messages: {
              reference1: nil,
              reference2: nil,
              reference3: nil,
            },
            external_package_id: "string",
            label_download: {
              href: "https://api.shipengine.com/v1/labels/se-28529731",
              pdf: "https://api.shipengine.com/v1/labels/se-28529731",
              png: "https://api.shipengine.com/v1/labels/se-28529731",
              zpl: "https://api.shipengine.com/v1/labels/se-28529731",
            },
            form_download: {
              href: "https://api.shipengine.com/v1/labels/se-28529731",
              type: "string",
            },
            sequence: 0,
          },
        ],
        total_weight: {
          value: 0,
          unit: "pound",
        },
        rate_response: {
          rates: [
            {
              rate_id: "se-28529731",
              rate_type: "check",
              carrier_id: "se-28529731",
              shipping_amount: {
                currency: "string",
                amount: 0,
              },
              insurance_amount: {
                currency: "string",
                amount: 0,
              },
              confirmation_amount: {
                currency: "string",
                amount: 0,
              },
              other_amount: {
                currency: "string",
                amount: 0,
              },
              tax_amount: {
                currency: "string",
                amount: 0,
              },
              zone: 6,
              package_type: "package",
              delivery_days: 5,
              guaranteed_service: true,
              estimated_delivery_date: "2018-09-23T00:00:00.000Z",
              carrier_delivery_days: "string",
              ship_date: "2022-11-07T00:19:51Z",
              negotiated_rate: true,
              service_type: "string",
              service_code: "string",
              trackable: true,
              carrier_code: "string",
              carrier_nickname: "string",
              carrier_friendly_name: "string",
              validation_status: "valid",
              warning_messages: ["string"],
              error_messages: ["string"],
            },
          ],
          invalid_rates: [],
          rate_request_id: "se-28529731",
          shipment_id: "se-28529731",
          created_at: "se-28529731",
          status: "working",
          errors: [],
        },
      }

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.rates.root}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = rates.shipping_rates(params: params)

      assert_requested(request, times: 1)

      expect(response.shipment_id).to(eq(expected_response[:shipment_id]))
      expect(response.carrier_id).to(eq(expected_response[:carrier_id]))
      expect(response.service_code).to(eq(expected_response[:service_code]))
      expect(response.external_order_id).to(eq(expected_response[:external_order_id]))
      expect(response.items).to(eq(expected_response[:items]))

      expect(response.tax_identifiers[0].taxable_entity_type).to(eq(expected_response[:tax_identifiers][0][:taxable_entity_type]))
      expect(response.tax_identifiers[0].identifier_type).to(eq(expected_response[:tax_identifiers][0][:identifier_type]))
      expect(response.tax_identifiers[0].issuing_authority).to(eq(expected_response[:tax_identifiers][0][:issuing_authority]))
      expect(response.tax_identifiers[0].value).to(eq(expected_response[:tax_identifiers][0][:value]))

      expect(response.external_shipment_id).to(eq(expected_response[:external_shipment_id]))
      expect(response.shipment_number).to(eq(expected_response[:shipment_number]))
      expect(response.ship_date).to(eq(expected_response[:ship_date]))
      expect(response.created_at).to(eq(expected_response[:created_at]))
      expect(response.modified_at).to(eq(expected_response[:modified_at]))
      expect(response.shipment_status).to(eq(expected_response[:shipment_status]))

      expect(response.ship_to.name).to(eq(expected_response[:ship_to][:name]))
      expect(response.ship_to.phone).to(eq(expected_response[:ship_to][:phone]))
      expect(response.ship_to.company_name).to(eq(expected_response[:ship_to][:company_name]))
      expect(response.ship_to.address_line1).to(eq(expected_response[:ship_to][:address_line1]))
      expect(response.ship_to.address_line2).to(eq(expected_response[:ship_to][:address_line2]))
      expect(response.ship_to.address_line3).to(eq(expected_response[:ship_to][:address_line3]))
      expect(response.ship_to.city_locality).to(eq(expected_response[:ship_to][:city_locality]))
      expect(response.ship_to.state_province).to(eq(expected_response[:ship_to][:state_province]))
      expect(response.ship_to.postal_code).to(eq(expected_response[:ship_to][:postal_code]))
      expect(response.ship_to.country_code).to(eq(expected_response[:ship_to][:country_code]))
      expect(response.ship_to.address_residential_indicator).to(eq(expected_response[:ship_to][:address_residential_indicator]))

      expect(response.ship_from.name).to(eq(expected_response[:ship_from][:name]))
      expect(response.ship_from.phone).to(eq(expected_response[:ship_from][:phone]))
      expect(response.ship_from.company_name).to(eq(expected_response[:ship_from][:company_name]))
      expect(response.ship_from.address_line1).to(eq(expected_response[:ship_from][:address_line1]))
      expect(response.ship_from.address_line2).to(eq(expected_response[:ship_from][:address_line2]))
      expect(response.ship_from.address_line3).to(eq(expected_response[:ship_from][:address_line3]))
      expect(response.ship_from.city_locality).to(eq(expected_response[:ship_from][:city_locality]))
      expect(response.ship_from.state_province).to(eq(expected_response[:ship_from][:state_province]))
      expect(response.ship_from.postal_code).to(eq(expected_response[:ship_from][:postal_code]))
      expect(response.ship_from.country_code).to(eq(expected_response[:ship_from][:country_code]))
      expect(response.ship_from.address_residential_indicator).to(eq(expected_response[:ship_from][:address_residential_indicator]))

      expect(response.warehouse_id).to(eq(expected_response[:warehouse_id]))

      expect(response.return_to.name).to(eq(expected_response[:return_to][:name]))
      expect(response.return_to.phone).to(eq(expected_response[:return_to][:phone]))
      expect(response.return_to.company_name).to(eq(expected_response[:return_to][:company_name]))
      expect(response.return_to.address_line1).to(eq(expected_response[:return_to][:address_line1]))
      expect(response.return_to.address_line2).to(eq(expected_response[:return_to][:address_line2]))
      expect(response.return_to.address_line3).to(eq(expected_response[:return_to][:address_line3]))
      expect(response.return_to.city_locality).to(eq(expected_response[:return_to][:city_locality]))
      expect(response.return_to.state_province).to(eq(expected_response[:return_to][:state_province]))
      expect(response.return_to.postal_code).to(eq(expected_response[:return_to][:postal_code]))
      expect(response.return_to.country_code).to(eq(expected_response[:return_to][:country_code]))
      expect(response.return_to.address_residential_indicator).to(eq(expected_response[:return_to][:address_residential_indicator]))

      expect(response.confirmation).to(eq(expected_response[:confirmation]))

      expect(response.customs.contents).to(eq(expected_response[:customs][:contents]))
      expect(response.customs.non_delivery).to(eq(expected_response[:customs][:non_delivery]))
      expect(response.customs.customs_items).to(eq(expected_response[:customs][:customs_items]))

      expect(response.advanced_options.bill_to_account).to(eq(expected_response[:advanced_options][:bill_to_account]))
      expect(response.advanced_options.bill_to_country_code).to(eq(expected_response[:advanced_options][:bill_to_country_code]))
      expect(response.advanced_options.bill_to_party).to(eq(expected_response[:advanced_options][:bill_to_party]))
      expect(response.advanced_options.bill_to_postal_code).to(eq(expected_response[:advanced_options][:bill_to_postal_code]))
      expect(response.advanced_options.contains_alcohol).to(eq(expected_response[:advanced_options][:contains_alcohol]))
      expect(response.advanced_options.delivered_duty_paid).to(eq(expected_response[:advanced_options][:delivered_duty_paid]))
      expect(response.advanced_options.dry_ice).to(eq(expected_response[:advanced_options][:dry_ice]))
      expect(response.advanced_options.dry_ice_weight.value).to(eq(expected_response[:advanced_options][:dry_ice_weight][:value]))
      expect(response.advanced_options.dry_ice_weight.unit).to(eq(expected_response[:advanced_options][:dry_ice_weight][:unit]))
      expect(response.advanced_options.non_machinable).to(eq(expected_response[:advanced_options][:non_machinable]))
      expect(response.advanced_options.saturday_delivery).to(eq(expected_response[:advanced_options][:saturday_delivery]))
      expect(response.advanced_options.fedex_freight.shipper_load_and_count).to(eq(expected_response[:advanced_options][:fedex_freight][:shipper_load_and_count]))
      expect(response.advanced_options.fedex_freight.booking_confirmation).to(eq(expected_response[:advanced_options][:fedex_freight][:booking_confirmation]))
      expect(response.advanced_options.use_ups_ground_freight_pricing).to(eq(expected_response[:advanced_options][:use_ups_ground_freight_pricing]))
      expect(response.advanced_options.freight_class).to(eq(expected_response[:advanced_options][:freight_class]))
      expect(response.advanced_options.custom_field1).to(eq(expected_response[:advanced_options][:custom_field1]))
      expect(response.advanced_options.custom_field2).to(eq(expected_response[:advanced_options][:custom_field2]))
      expect(response.advanced_options.custom_field3).to(eq(expected_response[:advanced_options][:custom_field3]))
      expect(response.advanced_options.origin_type).to(eq(expected_response[:advanced_options][:origin_type]))
      expect(response.advanced_options.shipper_release).to(eq(expected_response[:advanced_options][:shipper_release]))
      expect(response.advanced_options.collect_on_delivery.payment_type).to(eq(expected_response[:advanced_options][:collect_on_delivery][:payment_type]))
      expect(response.advanced_options.collect_on_delivery.payment_amount.currency).to(eq(expected_response[:advanced_options][:collect_on_delivery][:payment_amount][:currency]))
      expect(response.advanced_options.collect_on_delivery.payment_amount.amount).to(eq(expected_response[:advanced_options][:collect_on_delivery][:payment_amount][:amount]))

      expect(response.origin_type).to(eq(expected_response[:origin_type]))
      expect(response.insurance_provider).to(eq(expected_response[:insurance_provider]))
      expect(response.tags).to(eq(expected_response[:tags]))
      expect(response.order_source_code).to(eq(expected_response[:order_source_code]))

      expect(response.packages[0].package_id).to(eq(expected_response[:packages][0][:package_id]))
      expect(response.packages[0].package_code).to(eq(expected_response[:packages][0][:package_code]))
      expect(response.packages[0].weight.value).to(eq(expected_response[:packages][0][:weight][:value]))
      expect(response.packages[0].weight.unit).to(eq(expected_response[:packages][0][:weight][:unit]))
      expect(response.packages[0].dimensions["unit"]).to(eq(expected_response[:packages][0][:dimensions][:unit]))
      expect(response.packages[0].dimensions["length"]).to(eq(expected_response[:packages][0][:dimensions][:length]))
      expect(response.packages[0].dimensions["width"]).to(eq(expected_response[:packages][0][:dimensions][:width]))
      expect(response.packages[0].dimensions["height"]).to(eq(expected_response[:packages][0][:dimensions][:height]))
      expect(response.packages[0].insured_value["0"].currency).to(eq(expected_response[:packages][0][:insured_value]["0".to_sym][:currency]))
      expect(response.packages[0].insured_value["0"].amount).to(eq(expected_response[:packages][0][:insured_value]["0".to_sym][:amount]))
      expect(response.packages[0].insured_value.currency).to(eq(expected_response[:packages][0][:insured_value][:currency]))
      expect(response.packages[0].insured_value.amount).to(eq(expected_response[:packages][0][:insured_value][:amount]))
      expect(response.packages[0].tracking_number).to(eq(expected_response[:packages][0][:tracking_number]))
      expect(response.packages[0].label_messages.reference1).to(eq(expected_response[:packages][0][:label_messages][:reference1]))
      expect(response.packages[0].label_messages.reference2).to(eq(expected_response[:packages][0][:label_messages][:reference2]))
      expect(response.packages[0].label_messages.reference3).to(eq(expected_response[:packages][0][:label_messages][:reference3]))
      expect(response.packages[0].external_package_id).to(eq(expected_response[:packages][0][:external_package_id]))
      expect(response.packages[0].label_download.href).to(eq(expected_response[:packages][0][:label_download][:href]))
      expect(response.packages[0].form_download.href).to(eq(expected_response[:packages][0][:form_download][:href]))
      expect(response.packages[0].sequence).to(eq(expected_response[:packages][0][:sequence]))

      expect(response.total_weight.value).to(eq(expected_response[:total_weight][:value]))
      expect(response.total_weight.unit).to(eq(expected_response[:total_weight][:unit]))

      expect(response.rate_response.rates[0].rate_id).to(eq(expected_response[:rate_response][:rates][0][:rate_id]))
      expect(response.rate_response.rates[0].rate_type).to(eq(expected_response[:rate_response][:rates][0][:rate_type]))
      expect(response.rate_response.rates[0].carrier_id).to(eq(expected_response[:rate_response][:rates][0][:carrier_id]))
      expect(response.rate_response.rates[0].shipping_amount.currency).to(eq(expected_response[:rate_response][:rates][0][:shipping_amount][:currency]))
      expect(response.rate_response.rates[0].shipping_amount.amount).to(eq(expected_response[:rate_response][:rates][0][:shipping_amount][:amount]))
      expect(response.rate_response.rates[0].insurance_amount.currency).to(eq(expected_response[:rate_response][:rates][0][:insurance_amount][:currency]))
      expect(response.rate_response.rates[0].insurance_amount.amount).to(eq(expected_response[:rate_response][:rates][0][:insurance_amount][:amount]))
      expect(response.rate_response.rates[0].confirmation_amount.currency).to(eq(expected_response[:rate_response][:rates][0][:confirmation_amount][:currency]))
      expect(response.rate_response.rates[0].confirmation_amount.amount).to(eq(expected_response[:rate_response][:rates][0][:confirmation_amount][:amount]))
      expect(response.rate_response.rates[0].other_amount.currency).to(eq(expected_response[:rate_response][:rates][0][:other_amount][:currency]))
      expect(response.rate_response.rates[0].other_amount.amount).to(eq(expected_response[:rate_response][:rates][0][:other_amount][:amount]))
      expect(response.rate_response.rates[0].tax_amount.currency).to(eq(expected_response[:rate_response][:rates][0][:tax_amount][:currency]))
      expect(response.rate_response.rates[0].tax_amount.amount).to(eq(expected_response[:rate_response][:rates][0][:tax_amount][:amount]))
      expect(response.rate_response.rates[0].zone).to(eq(expected_response[:rate_response][:rates][0][:zone]))
      expect(response.rate_response.rates[0].package_type).to(eq(expected_response[:rate_response][:rates][0][:package_type]))
      expect(response.rate_response.rates[0].delivery_days).to(eq(expected_response[:rate_response][:rates][0][:delivery_days]))
      expect(response.rate_response.rates[0].guaranteed_service).to(eq(expected_response[:rate_response][:rates][0][:guaranteed_service]))
      expect(response.rate_response.rates[0].estimated_delivery_date).to(eq(expected_response[:rate_response][:rates][0][:estimated_delivery_date]))
      expect(response.rate_response.rates[0].carrier_delivery_days).to(eq(expected_response[:rate_response][:rates][0][:carrier_delivery_days]))
      expect(response.rate_response.rates[0].ship_date).to(eq(expected_response[:rate_response][:rates][0][:ship_date]))
      expect(response.rate_response.rates[0].negotiated_rate).to(eq(expected_response[:rate_response][:rates][0][:negotiated_rate]))
      expect(response.rate_response.rates[0].service_type).to(eq(expected_response[:rate_response][:rates][0][:service_type]))
      expect(response.rate_response.rates[0].service_code).to(eq(expected_response[:rate_response][:rates][0][:service_code]))
      expect(response.rate_response.rates[0].trackable).to(eq(expected_response[:rate_response][:rates][0][:trackable]))
      expect(response.rate_response.rates[0].carrier_code).to(eq(expected_response[:rate_response][:rates][0][:carrier_code]))
      expect(response.rate_response.rates[0].carrier_nickname).to(eq(expected_response[:rate_response][:rates][0][:carrier_nickname]))
      expect(response.rate_response.rates[0].carrier_friendly_name).to(eq(expected_response[:rate_response][:rates][0][:carrier_friendly_name]))
      expect(response.rate_response.rates[0].validation_status).to(eq(expected_response[:rate_response][:rates][0][:validation_status]))
      expect(response.rate_response.rates[0].warning_messages).to(eq(expected_response[:rate_response][:rates][0][:warning_messages]))
      expect(response.rate_response.rates[0].error_messages).to(eq(expected_response[:rate_response][:rates][0][:error_messages]))

      expect(response.rate_response.invalid_rates).to(eq(expected_response[:rate_response][:invalid_rates]))
      expect(response.rate_response.rate_request_id).to(eq(expected_response[:rate_response][:rate_request_id]))
      expect(response.rate_response.shipment_id).to(eq(expected_response[:rate_response][:shipment_id]))
      expect(response.rate_response.created_at).to(eq(expected_response[:rate_response][:created_at]))
      expect(response.rate_response.status).to(eq(expected_response[:rate_response][:status]))
      expect(response.rate_response.errors).to(eq(expected_response[:rate_response][:errors]))
    end
  end

  context "Get Bulk Rates" do
    it "should get bulk rates" do
      params = {
        shipment_ids: ["se-28529731"],
        rate_options: {
          carrier_ids: ["se-28529731"],
          package_types: ["string"],
          service_codes: ["string"],
          calculate_tax_amount: true,
          preferred_currency: "string",
          is_return: true,
        },
      }
      expected_response = [
        {
          rate_request_id: "se-28529731",
          shipment_id: "se-28529731",
          created_at: "2018-09-23T15:00:00.000Z",
          status: "working",
          errors: [],
        },
      ]

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.rates.root}/bulk"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = rates.bulk_rates(params: params)

      assert_requested(request, times: 1)

      expect(response[0].rate_request_id).to(eq(expected_response[0][:rate_request_id]))
      expect(response[0].shipment_id).to(eq(expected_response[0][:shipment_id]))
      expect(response[0].created_at).to(eq(expected_response[0][:created_at]))
      expect(response[0].status).to(eq(expected_response[0][:status]))
      expect(response[0].errors).to(eq(expected_response[0][:errors]))
    end
  end

  context "Estimate Rates" do
    it "should estimate rates" do
      params = {
        carrier_id: "se-28529731",
        from_country_code: "CA",
        from_postal_code: "78756-3717",
        from_city_locality: "Austin",
        from_state_province: "Austin",
        to_country_code: "CA",
        to_postal_code: "78756-3717",
        to_city_locality: "Austin",
        to_state_province: "Houston",
        weight: {
          value: 0,
          unit: "pound",
        },
        dimensions: {
          unit: "inch",
          length: 0,
          width: 0,
          height: 0,
        },
        confirmation: "none",
        address_residential_indicator: "unknown",
        ship_date: "2018-09-23T15:00:00.000Z",
      }
      expected_response = [
        {
          rate_type: "check",
          carrier_id: "se-28529731",
          shipping_amount: {
            currency: "string",
            amount: 0,
          },
          insurance_amount: {
            currency: "string",
            amount: 0,
          },
          confirmation_amount: {
            currency: "string",
            amount: 0,
          },
          other_amount: {
            currency: "string",
            amount: 0,
          },
          tax_amount: {
            currency: "string",
            amount: 0,
          },
          zone: 6,
          package_type: "package",
          delivery_days: 5,
          guaranteed_service: true,
          estimated_delivery_date: "2018-09-23T00:00:00.000Z",
          carrier_delivery_days: "string",
          ship_date: "2022-11-07T00:19:51Z",
          negotiated_rate: true,
          service_type: "string",
          service_code: "string",
          trackable: true,
          carrier_code: "string",
          carrier_nickname: "string",
          carrier_friendly_name: "string",
          validation_status: "valid",
          warning_messages: ["string"],
          error_messages: ["string"],
        },
      ]

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.rates.root}/estimate"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = rates.estimate_rates(params: params)

      assert_requested(request, times: 1)

      expect(response[0].rate_type).to(eq(expected_response[0][:rate_type]))
      expect(response[0].carrier_id).to(eq(expected_response[0][:carrier_id]))
      expect(response[0].created_at).to(eq(expected_response[0][:created_at]))

      expect(response[0].shipping_amount.currency).to(eq(expected_response[0][:shipping_amount][:currency]))
      expect(response[0].shipping_amount.amount).to(eq(expected_response[0][:shipping_amount][:amount]))

      expect(response[0].insurance_amount.currency).to(eq(expected_response[0][:insurance_amount][:currency]))
      expect(response[0].insurance_amount.amount).to(eq(expected_response[0][:insurance_amount][:amount]))

      expect(response[0].confirmation_amount.currency).to(eq(expected_response[0][:confirmation_amount][:currency]))
      expect(response[0].confirmation_amount.amount).to(eq(expected_response[0][:confirmation_amount][:amount]))

      expect(response[0].other_amount.currency).to(eq(expected_response[0][:other_amount][:currency]))
      expect(response[0].other_amount.amount).to(eq(expected_response[0][:other_amount][:amount]))

      expect(response[0].tax_amount.currency).to(eq(expected_response[0][:tax_amount][:currency]))
      expect(response[0].tax_amount.amount).to(eq(expected_response[0][:tax_amount][:amount]))

      expect(response[0].zone).to(eq(expected_response[0][:zone]))
      expect(response[0].package_type).to(eq(expected_response[0][:package_type]))
      expect(response[0].delivery_days).to(eq(expected_response[0][:delivery_days]))
      expect(response[0].guaranteed_service).to(eq(expected_response[0][:guaranteed_service]))
      expect(response[0].estimated_delivery_date).to(eq(expected_response[0][:estimated_delivery_date]))
      expect(response[0].carrier_delivery_days).to(eq(expected_response[0][:carrier_delivery_days]))
      expect(response[0].ship_date).to(eq(expected_response[0][:ship_date]))
      expect(response[0].negotiated_rate).to(eq(expected_response[0][:negotiated_rate]))
      expect(response[0].service_type).to(eq(expected_response[0][:service_type]))
      expect(response[0].service_code).to(eq(expected_response[0][:service_code]))
      expect(response[0].trackable).to(eq(expected_response[0][:trackable]))
      expect(response[0].carrier_code).to(eq(expected_response[0][:carrier_code]))
      expect(response[0].carrier_nickname).to(eq(expected_response[0][:carrier_nickname]))
      expect(response[0].carrier_friendly_name).to(eq(expected_response[0][:carrier_friendly_name]))
      expect(response[0].validation_status).to(eq(expected_response[0][:validation_status]))
      expect(response[0].warning_messages).to(eq(expected_response[0][:warning_messages]))
      expect(response[0].error_messages).to(eq(expected_response[0][:error_messages]))
    end
  end

  context "Get Rate By ID" do
    it "should get rate by id" do
      rate_id = "se-28529731"
      params = {}
      expected_response = {
        rate_id: "se-28529731",
        rate_type: "check",
        carrier_id: "se-28529731",
        shipping_amount: {
          currency: "string",
          amount: 0,
        },
        insurance_amount: {
          currency: "string",
          amount: 0,
        },
        confirmation_amount: {
          currency: "string",
          amount: 0,
        },
        other_amount: {
          currency: "string",
          amount: 0,
        },
        tax_amount: {
          currency: "string",
          amount: 0,
        },
        zone: 6,
        package_type: "package",
        delivery_days: 5,
        guaranteed_service: true,
        estimated_delivery_date: "2018-09-23T00:00:00.000Z",
        carrier_delivery_days: "string",
        ship_date: "2022-11-07T00:19:51Z",
        negotiated_rate: true,
        service_type: "string",
        service_code: "string",
        trackable: true,
        carrier_code: "string",
        carrier_nickname: "string",
        carrier_friendly_name: "string",
        validation_status: "valid",
        warning_messages: ["string"],
        error_messages: ["string"],
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.rates.root}/#{rate_id}"
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

      response = rates.rate_by_id(rate_id: rate_id, params: params)

      assert_requested(request, times: 1)

      expect(response.rate_type).to(eq(expected_response[:rate_type]))
      expect(response.carrier_id).to(eq(expected_response[:carrier_id]))
      expect(response.created_at).to(eq(expected_response[:created_at]))

      expect(response.shipping_amount.currency).to(eq(expected_response[:shipping_amount][:currency]))
      expect(response.shipping_amount.amount).to(eq(expected_response[:shipping_amount][:amount]))

      expect(response.insurance_amount.currency).to(eq(expected_response[:insurance_amount][:currency]))
      expect(response.insurance_amount.amount).to(eq(expected_response[:insurance_amount][:amount]))

      expect(response.confirmation_amount.currency).to(eq(expected_response[:confirmation_amount][:currency]))
      expect(response.confirmation_amount.amount).to(eq(expected_response[:confirmation_amount][:amount]))

      expect(response.other_amount.currency).to(eq(expected_response[:other_amount][:currency]))
      expect(response.other_amount.amount).to(eq(expected_response[:other_amount][:amount]))

      expect(response.tax_amount.currency).to(eq(expected_response[:tax_amount][:currency]))
      expect(response.tax_amount.amount).to(eq(expected_response[:tax_amount][:amount]))

      expect(response.zone).to(eq(expected_response[:zone]))
      expect(response.package_type).to(eq(expected_response[:package_type]))
      expect(response.delivery_days).to(eq(expected_response[:delivery_days]))
      expect(response.guaranteed_service).to(eq(expected_response[:guaranteed_service]))
      expect(response.estimated_delivery_date).to(eq(expected_response[:estimated_delivery_date]))
      expect(response.carrier_delivery_days).to(eq(expected_response[:carrier_delivery_days]))
      expect(response.ship_date).to(eq(expected_response[:ship_date]))
      expect(response.negotiated_rate).to(eq(expected_response[:negotiated_rate]))
      expect(response.service_type).to(eq(expected_response[:service_type]))
      expect(response.service_code).to(eq(expected_response[:service_code]))
      expect(response.trackable).to(eq(expected_response[:trackable]))
      expect(response.carrier_code).to(eq(expected_response[:carrier_code]))
      expect(response.carrier_nickname).to(eq(expected_response[:carrier_nickname]))
      expect(response.carrier_friendly_name).to(eq(expected_response[:carrier_friendly_name]))
      expect(response.validation_status).to(eq(expected_response[:validation_status]))
      expect(response.warning_messages).to(eq(expected_response[:warning_messages]))
      expect(response.error_messages).to(eq(expected_response[:error_messages]))
    end
  end
end
