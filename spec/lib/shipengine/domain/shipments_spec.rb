# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::Shipments) do
  let(:shipments) { ShipEngine::Domain::Shipments.new }

  context "List Shipments" do
    it "should shipments" do
      params = {}
      expected_response = {
        shipments: [
          {
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
          },
        ],
        total: 200,
        page: 1,
        pages: 200,
        links: {
          first: {
            href: "https://api.shipengine.com/v1/labels/se-28529731",
            type: "string",
          },
          last: {
            href: "https://api.shipengine.com/v1/labels/se-28529731",
            type: "string",
          },
          prev: {
            href: "https://api.shipengine.com/v1/labels/se-28529731",
            type: "string",
          },
          next: {
            href: "https://api.shipengine.com/v1/labels/se-28529731",
            type: "string",
          },
        },
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.shipments.root}"
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

      response = shipments.list_shipments(params: params)

      assert_requested(request, times: 1)

      expect(response.shipments[0].shipment_id).to(eq(expected_response[:shipments][0][:shipment_id]))
      expect(response.shipments[0].carrier_id).to(eq(expected_response[:shipments][0][:carrier_id]))
      expect(response.shipments[0].service_code).to(eq(expected_response[:shipments][0][:service_code]))
      expect(response.shipments[0].external_order_id).to(eq(expected_response[:shipments][0][:external_order_id]))
      expect(response.shipments[0].items).to(eq(expected_response[:shipments][0][:items]))

      expect(response.shipments[0].tax_identifiers[0].taxable_entity_type).to(eq(expected_response[:shipments][0][:tax_identifiers][0][:taxable_entity_type]))
      expect(response.shipments[0].tax_identifiers[0].identifier_type).to(eq(expected_response[:shipments][0][:tax_identifiers][0][:identifier_type]))
      expect(response.shipments[0].tax_identifiers[0].issuing_authority).to(eq(expected_response[:shipments][0][:tax_identifiers][0][:issuing_authority]))
      expect(response.shipments[0].tax_identifiers[0].value).to(eq(expected_response[:shipments][0][:tax_identifiers][0][:value]))

      expect(response.shipments[0].external_shipment_id).to(eq(expected_response[:shipments][0][:external_shipment_id]))
      expect(response.shipments[0].shipment_number).to(eq(expected_response[:shipments][0][:shipment_number]))
      expect(response.shipments[0].ship_date).to(eq(expected_response[:shipments][0][:ship_date]))
      expect(response.shipments[0].created_at).to(eq(expected_response[:shipments][0][:created_at]))
      expect(response.shipments[0].modified_at).to(eq(expected_response[:shipments][0][:modified_at]))
      expect(response.shipments[0].shipment_status).to(eq(expected_response[:shipments][0][:shipment_status]))

      expect(response.shipments[0].ship_to.name).to(eq(expected_response[:shipments][0][:ship_to][:name]))
      expect(response.shipments[0].ship_to.phone).to(eq(expected_response[:shipments][0][:ship_to][:phone]))
      expect(response.shipments[0].ship_to.company_name).to(eq(expected_response[:shipments][0][:ship_to][:company_name]))
      expect(response.shipments[0].ship_to.address_line1).to(eq(expected_response[:shipments][0][:ship_to][:address_line1]))
      expect(response.shipments[0].ship_to.address_line2).to(eq(expected_response[:shipments][0][:ship_to][:address_line2]))
      expect(response.shipments[0].ship_to.address_line3).to(eq(expected_response[:shipments][0][:ship_to][:address_line3]))
      expect(response.shipments[0].ship_to.city_locality).to(eq(expected_response[:shipments][0][:ship_to][:city_locality]))
      expect(response.shipments[0].ship_to.state_province).to(eq(expected_response[:shipments][0][:ship_to][:state_province]))
      expect(response.shipments[0].ship_to.postal_code).to(eq(expected_response[:shipments][0][:ship_to][:postal_code]))
      expect(response.shipments[0].ship_to.country_code).to(eq(expected_response[:shipments][0][:ship_to][:country_code]))
      expect(response.shipments[0].ship_to.address_residential_indicator).to(eq(expected_response[:shipments][0][:ship_to][:address_residential_indicator]))

      expect(response.shipments[0].ship_from.name).to(eq(expected_response[:shipments][0][:ship_from][:name]))
      expect(response.shipments[0].ship_from.phone).to(eq(expected_response[:shipments][0][:ship_from][:phone]))
      expect(response.shipments[0].ship_from.company_name).to(eq(expected_response[:shipments][0][:ship_from][:company_name]))
      expect(response.shipments[0].ship_from.address_line1).to(eq(expected_response[:shipments][0][:ship_from][:address_line1]))
      expect(response.shipments[0].ship_from.address_line2).to(eq(expected_response[:shipments][0][:ship_from][:address_line2]))
      expect(response.shipments[0].ship_from.address_line3).to(eq(expected_response[:shipments][0][:ship_from][:address_line3]))
      expect(response.shipments[0].ship_from.city_locality).to(eq(expected_response[:shipments][0][:ship_from][:city_locality]))
      expect(response.shipments[0].ship_from.state_province).to(eq(expected_response[:shipments][0][:ship_from][:state_province]))
      expect(response.shipments[0].ship_from.postal_code).to(eq(expected_response[:shipments][0][:ship_from][:postal_code]))
      expect(response.shipments[0].ship_from.country_code).to(eq(expected_response[:shipments][0][:ship_from][:country_code]))
      expect(response.shipments[0].ship_from.address_residential_indicator).to(eq(expected_response[:shipments][0][:ship_from][:address_residential_indicator]))

      expect(response.shipments[0].warehouse_id).to(eq(expected_response[:shipments][0][:warehouse_id]))

      expect(response.shipments[0].return_to.name).to(eq(expected_response[:shipments][0][:return_to][:name]))
      expect(response.shipments[0].return_to.phone).to(eq(expected_response[:shipments][0][:return_to][:phone]))
      expect(response.shipments[0].return_to.company_name).to(eq(expected_response[:shipments][0][:return_to][:company_name]))
      expect(response.shipments[0].return_to.address_line1).to(eq(expected_response[:shipments][0][:return_to][:address_line1]))
      expect(response.shipments[0].return_to.address_line2).to(eq(expected_response[:shipments][0][:return_to][:address_line2]))
      expect(response.shipments[0].return_to.address_line3).to(eq(expected_response[:shipments][0][:return_to][:address_line3]))
      expect(response.shipments[0].return_to.city_locality).to(eq(expected_response[:shipments][0][:return_to][:city_locality]))
      expect(response.shipments[0].return_to.state_province).to(eq(expected_response[:shipments][0][:return_to][:state_province]))
      expect(response.shipments[0].return_to.postal_code).to(eq(expected_response[:shipments][0][:return_to][:postal_code]))
      expect(response.shipments[0].return_to.country_code).to(eq(expected_response[:shipments][0][:return_to][:country_code]))
      expect(response.shipments[0].return_to.address_residential_indicator).to(eq(expected_response[:shipments][0][:return_to][:address_residential_indicator]))

      expect(response.shipments[0].confirmation).to(eq(expected_response[:shipments][0][:confirmation]))

      expect(response.shipments[0].customs.contents).to(eq(expected_response[:shipments][0][:customs][:contents]))
      expect(response.shipments[0].customs.non_delivery).to(eq(expected_response[:shipments][0][:customs][:non_delivery]))
      expect(response.shipments[0].customs.customs_items).to(eq(expected_response[:shipments][0][:customs][:customs_items]))

      expect(response.shipments[0].advanced_options.bill_to_account).to(eq(expected_response[:shipments][0][:advanced_options][:bill_to_account]))
      expect(response.shipments[0].advanced_options.bill_to_country_code).to(eq(expected_response[:shipments][0][:advanced_options][:bill_to_country_code]))
      expect(response.shipments[0].advanced_options.bill_to_party).to(eq(expected_response[:shipments][0][:advanced_options][:bill_to_party]))
      expect(response.shipments[0].advanced_options.bill_to_postal_code).to(eq(expected_response[:shipments][0][:advanced_options][:bill_to_postal_code]))
      expect(response.shipments[0].advanced_options.contains_alcohol).to(eq(expected_response[:shipments][0][:advanced_options][:contains_alcohol]))
      expect(response.shipments[0].advanced_options.delivered_duty_paid).to(eq(expected_response[:shipments][0][:advanced_options][:delivered_duty_paid]))
      expect(response.shipments[0].advanced_options.dry_ice).to(eq(expected_response[:shipments][0][:advanced_options][:dry_ice]))
      expect(response.shipments[0].advanced_options.dry_ice_weight.value).to(eq(expected_response[:shipments][0][:advanced_options][:dry_ice_weight][:value]))
      expect(response.shipments[0].advanced_options.dry_ice_weight.unit).to(eq(expected_response[:shipments][0][:advanced_options][:dry_ice_weight][:unit]))
      expect(response.shipments[0].advanced_options.non_machinable).to(eq(expected_response[:shipments][0][:advanced_options][:non_machinable]))
      expect(response.shipments[0].advanced_options.saturday_delivery).to(eq(expected_response[:shipments][0][:advanced_options][:saturday_delivery]))
      expect(response.shipments[0].advanced_options.fedex_freight.shipper_load_and_count).to(eq(expected_response[:shipments][0][:advanced_options][:fedex_freight][:shipper_load_and_count]))
      expect(response.shipments[0].advanced_options.fedex_freight.booking_confirmation).to(eq(expected_response[:shipments][0][:advanced_options][:fedex_freight][:booking_confirmation]))
      expect(response.shipments[0].advanced_options.use_ups_ground_freight_pricing).to(eq(expected_response[:shipments][0][:advanced_options][:use_ups_ground_freight_pricing]))
      expect(response.shipments[0].advanced_options.freight_class).to(eq(expected_response[:shipments][0][:advanced_options][:freight_class]))
      expect(response.shipments[0].advanced_options.custom_field1).to(eq(expected_response[:shipments][0][:advanced_options][:custom_field1]))
      expect(response.shipments[0].advanced_options.custom_field2).to(eq(expected_response[:shipments][0][:advanced_options][:custom_field2]))
      expect(response.shipments[0].advanced_options.custom_field3).to(eq(expected_response[:shipments][0][:advanced_options][:custom_field3]))
      expect(response.shipments[0].advanced_options.origin_type).to(eq(expected_response[:shipments][0][:advanced_options][:origin_type]))
      expect(response.shipments[0].advanced_options.shipper_release).to(eq(expected_response[:shipments][0][:advanced_options][:shipper_release]))
      expect(response.shipments[0].advanced_options.collect_on_delivery.payment_type).to(eq(expected_response[:shipments][0][:advanced_options][:collect_on_delivery][:payment_type]))
      expect(response.shipments[0].advanced_options.collect_on_delivery.payment_amount.currency).to(eq(expected_response[:shipments][0][:advanced_options][:collect_on_delivery][:payment_amount][:currency]))
      expect(response.shipments[0].advanced_options.collect_on_delivery.payment_amount.amount).to(eq(expected_response[:shipments][0][:advanced_options][:collect_on_delivery][:payment_amount][:amount]))

      expect(response.shipments[0].origin_type).to(eq(expected_response[:shipments][0][:origin_type]))
      expect(response.shipments[0].insurance_provider).to(eq(expected_response[:shipments][0][:insurance_provider]))
      expect(response.shipments[0].tags).to(eq(expected_response[:shipments][0][:tags]))
      expect(response.shipments[0].order_source_code).to(eq(expected_response[:shipments][0][:order_source_code]))

      expect(response.shipments[0].packages[0].package_id).to(eq(expected_response[:shipments][0][:packages][0][:package_id]))
      expect(response.shipments[0].packages[0].package_code).to(eq(expected_response[:shipments][0][:packages][0][:package_code]))
      expect(response.shipments[0].packages[0].weight.value).to(eq(expected_response[:shipments][0][:packages][0][:weight][:value]))
      expect(response.shipments[0].packages[0].weight.unit).to(eq(expected_response[:shipments][0][:packages][0][:weight][:unit]))
      expect(response.shipments[0].packages[0].dimensions["unit"]).to(eq(expected_response[:shipments][0][:packages][0][:dimensions][:unit]))
      expect(response.shipments[0].packages[0].dimensions["length"]).to(eq(expected_response[:shipments][0][:packages][0][:dimensions][:length]))
      expect(response.shipments[0].packages[0].dimensions["width"]).to(eq(expected_response[:shipments][0][:packages][0][:dimensions][:width]))
      expect(response.shipments[0].packages[0].dimensions["height"]).to(eq(expected_response[:shipments][0][:packages][0][:dimensions][:height]))
      expect(response.shipments[0].packages[0].insured_value["0"].currency).to(eq(expected_response[:shipments][0][:packages][0][:insured_value]["0".to_sym][:currency]))
      expect(response.shipments[0].packages[0].insured_value["0"].amount).to(eq(expected_response[:shipments][0][:packages][0][:insured_value]["0".to_sym][:amount]))
      expect(response.shipments[0].packages[0].insured_value.currency).to(eq(expected_response[:shipments][0][:packages][0][:insured_value][:currency]))
      expect(response.shipments[0].packages[0].insured_value.amount).to(eq(expected_response[:shipments][0][:packages][0][:insured_value][:amount]))
      expect(response.shipments[0].packages[0].tracking_number).to(eq(expected_response[:shipments][0][:packages][0][:tracking_number]))
      expect(response.shipments[0].packages[0].label_messages.reference1).to(eq(expected_response[:shipments][0][:packages][0][:label_messages][:reference1]))
      expect(response.shipments[0].packages[0].label_messages.reference2).to(eq(expected_response[:shipments][0][:packages][0][:label_messages][:reference2]))
      expect(response.shipments[0].packages[0].label_messages.reference3).to(eq(expected_response[:shipments][0][:packages][0][:label_messages][:reference3]))
      expect(response.shipments[0].packages[0].external_package_id).to(eq(expected_response[:shipments][0][:packages][0][:external_package_id]))
      expect(response.shipments[0].packages[0].label_download.href).to(eq(expected_response[:shipments][0][:packages][0][:label_download][:href]))
      expect(response.shipments[0].packages[0].form_download.href).to(eq(expected_response[:shipments][0][:packages][0][:form_download][:href]))
      expect(response.shipments[0].packages[0].sequence).to(eq(expected_response[:shipments][0][:packages][0][:sequence]))

      expect(response.shipments[0].total_weight.value).to(eq(expected_response[:shipments][0][:total_weight][:value]))
      expect(response.shipments[0].total_weight.unit).to(eq(expected_response[:shipments][0][:total_weight][:unit]))

      expect(response.total).to(eq(expected_response[:total]))
      expect(response.page).to(eq(expected_response[:page]))
      expect(response.pages).to(eq(expected_response[:pages]))
      expect(response.links["first"]["href"]).to(eq(expected_response[:links][:first][:href]))
      expect(response.links["last"]["href"]).to(eq(expected_response[:links][:last][:href]))
      expect(response.links["prev"]["href"]).to(eq(expected_response[:links][:prev][:href]))
      expect(response.links["next"]["href"]).to(eq(expected_response[:links][:next][:href]))
    end
  end

  context "Create Shipments" do
    it "should create shipments" do
      params = {
        shipments: [
          {
            validate_address: "no_validation",
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
            order_source_code: "amazon_ca",
            packages: [
              {
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
                label_messages: {
                  reference1: nil,
                  reference2: nil,
                  reference3: nil,
                },
                external_package_id: "string",
              },
            ],
          },
        ],
      }
      expected_response = {
        has_errors: false,
        shipments: [
          {
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
          },
        ],
        total: 200,
        page: 1,
        pages: 200,
        links: {
          first: {
            href: "https://api.shipengine.com/v1/labels/se-28529731",
            type: "string",
          },
          last: {
            href: "https://api.shipengine.com/v1/labels/se-28529731",
            type: "string",
          },
          prev: {
            href: "https://api.shipengine.com/v1/labels/se-28529731",
            type: "string",
          },
          next: {
            href: "https://api.shipengine.com/v1/labels/se-28529731",
            type: "string",
          },
        },
      }

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.shipments.root}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = shipments.create_shipments(params: params)

      assert_requested(request, times: 1)

      expect(response.has_errors).to(eq(expected_response[:has_errors]))

      expect(response.shipments[0].shipment_id).to(eq(expected_response[:shipments][0][:shipment_id]))
      expect(response.shipments[0].carrier_id).to(eq(expected_response[:shipments][0][:carrier_id]))
      expect(response.shipments[0].service_code).to(eq(expected_response[:shipments][0][:service_code]))
      expect(response.shipments[0].external_order_id).to(eq(expected_response[:shipments][0][:external_order_id]))
      expect(response.shipments[0].items).to(eq(expected_response[:shipments][0][:items]))

      expect(response.shipments[0].tax_identifiers[0].taxable_entity_type).to(eq(expected_response[:shipments][0][:tax_identifiers][0][:taxable_entity_type]))
      expect(response.shipments[0].tax_identifiers[0].identifier_type).to(eq(expected_response[:shipments][0][:tax_identifiers][0][:identifier_type]))
      expect(response.shipments[0].tax_identifiers[0].issuing_authority).to(eq(expected_response[:shipments][0][:tax_identifiers][0][:issuing_authority]))
      expect(response.shipments[0].tax_identifiers[0].value).to(eq(expected_response[:shipments][0][:tax_identifiers][0][:value]))

      expect(response.shipments[0].external_shipment_id).to(eq(expected_response[:shipments][0][:external_shipment_id]))
      expect(response.shipments[0].shipment_number).to(eq(expected_response[:shipments][0][:shipment_number]))
      expect(response.shipments[0].ship_date).to(eq(expected_response[:shipments][0][:ship_date]))
      expect(response.shipments[0].created_at).to(eq(expected_response[:shipments][0][:created_at]))
      expect(response.shipments[0].modified_at).to(eq(expected_response[:shipments][0][:modified_at]))
      expect(response.shipments[0].shipment_status).to(eq(expected_response[:shipments][0][:shipment_status]))

      expect(response.shipments[0].ship_to.name).to(eq(expected_response[:shipments][0][:ship_to][:name]))
      expect(response.shipments[0].ship_to.phone).to(eq(expected_response[:shipments][0][:ship_to][:phone]))
      expect(response.shipments[0].ship_to.company_name).to(eq(expected_response[:shipments][0][:ship_to][:company_name]))
      expect(response.shipments[0].ship_to.address_line1).to(eq(expected_response[:shipments][0][:ship_to][:address_line1]))
      expect(response.shipments[0].ship_to.address_line2).to(eq(expected_response[:shipments][0][:ship_to][:address_line2]))
      expect(response.shipments[0].ship_to.address_line3).to(eq(expected_response[:shipments][0][:ship_to][:address_line3]))
      expect(response.shipments[0].ship_to.city_locality).to(eq(expected_response[:shipments][0][:ship_to][:city_locality]))
      expect(response.shipments[0].ship_to.state_province).to(eq(expected_response[:shipments][0][:ship_to][:state_province]))
      expect(response.shipments[0].ship_to.postal_code).to(eq(expected_response[:shipments][0][:ship_to][:postal_code]))
      expect(response.shipments[0].ship_to.country_code).to(eq(expected_response[:shipments][0][:ship_to][:country_code]))
      expect(response.shipments[0].ship_to.address_residential_indicator).to(eq(expected_response[:shipments][0][:ship_to][:address_residential_indicator]))

      expect(response.shipments[0].ship_from.name).to(eq(expected_response[:shipments][0][:ship_from][:name]))
      expect(response.shipments[0].ship_from.phone).to(eq(expected_response[:shipments][0][:ship_from][:phone]))
      expect(response.shipments[0].ship_from.company_name).to(eq(expected_response[:shipments][0][:ship_from][:company_name]))
      expect(response.shipments[0].ship_from.address_line1).to(eq(expected_response[:shipments][0][:ship_from][:address_line1]))
      expect(response.shipments[0].ship_from.address_line2).to(eq(expected_response[:shipments][0][:ship_from][:address_line2]))
      expect(response.shipments[0].ship_from.address_line3).to(eq(expected_response[:shipments][0][:ship_from][:address_line3]))
      expect(response.shipments[0].ship_from.city_locality).to(eq(expected_response[:shipments][0][:ship_from][:city_locality]))
      expect(response.shipments[0].ship_from.state_province).to(eq(expected_response[:shipments][0][:ship_from][:state_province]))
      expect(response.shipments[0].ship_from.postal_code).to(eq(expected_response[:shipments][0][:ship_from][:postal_code]))
      expect(response.shipments[0].ship_from.country_code).to(eq(expected_response[:shipments][0][:ship_from][:country_code]))
      expect(response.shipments[0].ship_from.address_residential_indicator).to(eq(expected_response[:shipments][0][:ship_from][:address_residential_indicator]))

      expect(response.shipments[0].warehouse_id).to(eq(expected_response[:shipments][0][:warehouse_id]))

      expect(response.shipments[0].return_to.name).to(eq(expected_response[:shipments][0][:return_to][:name]))
      expect(response.shipments[0].return_to.phone).to(eq(expected_response[:shipments][0][:return_to][:phone]))
      expect(response.shipments[0].return_to.company_name).to(eq(expected_response[:shipments][0][:return_to][:company_name]))
      expect(response.shipments[0].return_to.address_line1).to(eq(expected_response[:shipments][0][:return_to][:address_line1]))
      expect(response.shipments[0].return_to.address_line2).to(eq(expected_response[:shipments][0][:return_to][:address_line2]))
      expect(response.shipments[0].return_to.address_line3).to(eq(expected_response[:shipments][0][:return_to][:address_line3]))
      expect(response.shipments[0].return_to.city_locality).to(eq(expected_response[:shipments][0][:return_to][:city_locality]))
      expect(response.shipments[0].return_to.state_province).to(eq(expected_response[:shipments][0][:return_to][:state_province]))
      expect(response.shipments[0].return_to.postal_code).to(eq(expected_response[:shipments][0][:return_to][:postal_code]))
      expect(response.shipments[0].return_to.country_code).to(eq(expected_response[:shipments][0][:return_to][:country_code]))
      expect(response.shipments[0].return_to.address_residential_indicator).to(eq(expected_response[:shipments][0][:return_to][:address_residential_indicator]))

      expect(response.shipments[0].confirmation).to(eq(expected_response[:shipments][0][:confirmation]))

      expect(response.shipments[0].customs.contents).to(eq(expected_response[:shipments][0][:customs][:contents]))
      expect(response.shipments[0].customs.non_delivery).to(eq(expected_response[:shipments][0][:customs][:non_delivery]))
      expect(response.shipments[0].customs.customs_items).to(eq(expected_response[:shipments][0][:customs][:customs_items]))

      expect(response.shipments[0].advanced_options.bill_to_account).to(eq(expected_response[:shipments][0][:advanced_options][:bill_to_account]))
      expect(response.shipments[0].advanced_options.bill_to_country_code).to(eq(expected_response[:shipments][0][:advanced_options][:bill_to_country_code]))
      expect(response.shipments[0].advanced_options.bill_to_party).to(eq(expected_response[:shipments][0][:advanced_options][:bill_to_party]))
      expect(response.shipments[0].advanced_options.bill_to_postal_code).to(eq(expected_response[:shipments][0][:advanced_options][:bill_to_postal_code]))
      expect(response.shipments[0].advanced_options.contains_alcohol).to(eq(expected_response[:shipments][0][:advanced_options][:contains_alcohol]))
      expect(response.shipments[0].advanced_options.delivered_duty_paid).to(eq(expected_response[:shipments][0][:advanced_options][:delivered_duty_paid]))
      expect(response.shipments[0].advanced_options.dry_ice).to(eq(expected_response[:shipments][0][:advanced_options][:dry_ice]))
      expect(response.shipments[0].advanced_options.dry_ice_weight.value).to(eq(expected_response[:shipments][0][:advanced_options][:dry_ice_weight][:value]))
      expect(response.shipments[0].advanced_options.dry_ice_weight.unit).to(eq(expected_response[:shipments][0][:advanced_options][:dry_ice_weight][:unit]))
      expect(response.shipments[0].advanced_options.non_machinable).to(eq(expected_response[:shipments][0][:advanced_options][:non_machinable]))
      expect(response.shipments[0].advanced_options.saturday_delivery).to(eq(expected_response[:shipments][0][:advanced_options][:saturday_delivery]))
      expect(response.shipments[0].advanced_options.fedex_freight.shipper_load_and_count).to(eq(expected_response[:shipments][0][:advanced_options][:fedex_freight][:shipper_load_and_count]))
      expect(response.shipments[0].advanced_options.fedex_freight.booking_confirmation).to(eq(expected_response[:shipments][0][:advanced_options][:fedex_freight][:booking_confirmation]))
      expect(response.shipments[0].advanced_options.use_ups_ground_freight_pricing).to(eq(expected_response[:shipments][0][:advanced_options][:use_ups_ground_freight_pricing]))
      expect(response.shipments[0].advanced_options.freight_class).to(eq(expected_response[:shipments][0][:advanced_options][:freight_class]))
      expect(response.shipments[0].advanced_options.custom_field1).to(eq(expected_response[:shipments][0][:advanced_options][:custom_field1]))
      expect(response.shipments[0].advanced_options.custom_field2).to(eq(expected_response[:shipments][0][:advanced_options][:custom_field2]))
      expect(response.shipments[0].advanced_options.custom_field3).to(eq(expected_response[:shipments][0][:advanced_options][:custom_field3]))
      expect(response.shipments[0].advanced_options.origin_type).to(eq(expected_response[:shipments][0][:advanced_options][:origin_type]))
      expect(response.shipments[0].advanced_options.shipper_release).to(eq(expected_response[:shipments][0][:advanced_options][:shipper_release]))
      expect(response.shipments[0].advanced_options.collect_on_delivery.payment_type).to(eq(expected_response[:shipments][0][:advanced_options][:collect_on_delivery][:payment_type]))
      expect(response.shipments[0].advanced_options.collect_on_delivery.payment_amount.currency).to(eq(expected_response[:shipments][0][:advanced_options][:collect_on_delivery][:payment_amount][:currency]))
      expect(response.shipments[0].advanced_options.collect_on_delivery.payment_amount.amount).to(eq(expected_response[:shipments][0][:advanced_options][:collect_on_delivery][:payment_amount][:amount]))

      expect(response.shipments[0].origin_type).to(eq(expected_response[:shipments][0][:origin_type]))
      expect(response.shipments[0].insurance_provider).to(eq(expected_response[:shipments][0][:insurance_provider]))
      expect(response.shipments[0].tags).to(eq(expected_response[:shipments][0][:tags]))
      expect(response.shipments[0].order_source_code).to(eq(expected_response[:shipments][0][:order_source_code]))

      expect(response.shipments[0].packages[0].package_id).to(eq(expected_response[:shipments][0][:packages][0][:package_id]))
      expect(response.shipments[0].packages[0].package_code).to(eq(expected_response[:shipments][0][:packages][0][:package_code]))
      expect(response.shipments[0].packages[0].weight.value).to(eq(expected_response[:shipments][0][:packages][0][:weight][:value]))
      expect(response.shipments[0].packages[0].weight.unit).to(eq(expected_response[:shipments][0][:packages][0][:weight][:unit]))
      expect(response.shipments[0].packages[0].dimensions["unit"]).to(eq(expected_response[:shipments][0][:packages][0][:dimensions][:unit]))
      expect(response.shipments[0].packages[0].dimensions["length"]).to(eq(expected_response[:shipments][0][:packages][0][:dimensions][:length]))
      expect(response.shipments[0].packages[0].dimensions["width"]).to(eq(expected_response[:shipments][0][:packages][0][:dimensions][:width]))
      expect(response.shipments[0].packages[0].dimensions["height"]).to(eq(expected_response[:shipments][0][:packages][0][:dimensions][:height]))
      expect(response.shipments[0].packages[0].insured_value["0"].currency).to(eq(expected_response[:shipments][0][:packages][0][:insured_value]["0".to_sym][:currency]))
      expect(response.shipments[0].packages[0].insured_value["0"].amount).to(eq(expected_response[:shipments][0][:packages][0][:insured_value]["0".to_sym][:amount]))
      expect(response.shipments[0].packages[0].insured_value.currency).to(eq(expected_response[:shipments][0][:packages][0][:insured_value][:currency]))
      expect(response.shipments[0].packages[0].insured_value.amount).to(eq(expected_response[:shipments][0][:packages][0][:insured_value][:amount]))
      expect(response.shipments[0].packages[0].tracking_number).to(eq(expected_response[:shipments][0][:packages][0][:tracking_number]))
      expect(response.shipments[0].packages[0].label_messages.reference1).to(eq(expected_response[:shipments][0][:packages][0][:label_messages][:reference1]))
      expect(response.shipments[0].packages[0].label_messages.reference2).to(eq(expected_response[:shipments][0][:packages][0][:label_messages][:reference2]))
      expect(response.shipments[0].packages[0].label_messages.reference3).to(eq(expected_response[:shipments][0][:packages][0][:label_messages][:reference3]))
      expect(response.shipments[0].packages[0].external_package_id).to(eq(expected_response[:shipments][0][:packages][0][:external_package_id]))
      expect(response.shipments[0].packages[0].label_download.href).to(eq(expected_response[:shipments][0][:packages][0][:label_download][:href]))
      expect(response.shipments[0].packages[0].form_download.href).to(eq(expected_response[:shipments][0][:packages][0][:form_download][:href]))
      expect(response.shipments[0].packages[0].sequence).to(eq(expected_response[:shipments][0][:packages][0][:sequence]))

      expect(response.shipments[0].total_weight.value).to(eq(expected_response[:shipments][0][:total_weight][:value]))
      expect(response.shipments[0].total_weight.unit).to(eq(expected_response[:shipments][0][:total_weight][:unit]))
    end
  end

  context "Get Shipment By External ID" do
    it "should get shipment by external id" do
      external_shipment_id = "0bcb569d-1727-4ff9-ab49-b2fec0cee5ae"
      params = {}
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
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.shipments.shipment_by_external_id}/#{external_shipment_id}"
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

      response = shipments.shipment_by_external_id(external_shipment_id: external_shipment_id, params: params)

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
    end
  end

  context "Parse shipping info" do
    it "should parse shipping info" do
      params = {
        text: "I have a 4oz package that's 5x10x14in, and I need to ship it to Margie McMiller at 3800 North Lamar suite 200 in austin, tx 78652. Please send it via USPS first class and require an adult signature. It also needs to be insured for $400.",
      }
      expected_response = {
        score: 0.9031369611169101,
        shipment: {
          carrier_id: "se-118608",
          service_code: "usps_first_class_mail",
          confirmation: "adult_signature",
          ship_to: {
            name: "Margie McMiller",
            company_name: "Adult Signature",
            address_line1: "3800 North Lamar",
            address_line2: "Suite 200",
            city_locality: "Austin",
            state_province: "TX",
            postal_code: 78652,
            address_residential_indicator: "unknown",
          },
          packages: [
            {
              weight: {
                value: 4,
                unit: "ounce",
              },
              dimensions: {
                length: 5,
                width: 10,
                height: 14,
                unit: "inch",
              },
              insured_value: {
                amount: 400,
                currency: "USD",
              },
            },
          ],
        },
        entities: [
          {
            type: "weight",
            score: 0.9805313966503588,
            text: "4oz",
            start_index: 9,
            end_index: 11,
            result: {
              value: 4,
              unit: "ounce",
            },
          },
          {
            type: "dimensions",
            score: 1,
            text: "5x10x14in",
            start_index: 28,
            end_index: 36,
            result: {
              length: 5,
              width: 10,
              height: 14,
              unit: "inch",
            },
          },
          {
            type: "dimension",
            score: 0.9805313966503588,
            text: "14in",
            start_index: 33,
            end_index: 36,
            result: {
              unit: "inch",
              value: 14,
            },
          },
          {
            type: "address",
            score: 0.9281558837267101,
            text: "to Margie McMiller at 3800 North Lamar suite 200 in austin, tx 78652. Please send it via USPS first class and require an adult signature",
            start_index: 61,
            end_index: 196,
            result: {
              direction: "to",
              name: "Margie McMiller",
              company_name: "Adult Signature",
              address_line1: "3800 North Lamar",
              address_line2: "Suite 200",
              city_locality: "Austin",
              state_province: "TX",
              postal_code: 78652,
            },
          },
          {
            type: "person",
            score: 0.9519646137063122,
            text: "Margie McMiller",
            start_index: 64,
            end_index: 78,
            result: {
              value: "Margie McMiller",
            },
          },
          {
            type: "address_line",
            score: 0.9805313966503588,
            text: "3800 North Lamar",
            start_index: 83,
            end_index: 98,
            result: {
              line: 1,
              value: "3800 North Lamar",
            },
          },
          {
            type: "number",
            score: 0.9805313966503588,
            text: 3800,
            start_index: 83,
            end_index: 86,
            result: {
              type: "cardinal",
              value: 3800,
            },
          },
          {
            type: "address_line",
            score: 1,
            text: "suite 200",
            start_index: 100,
            end_index: 108,
            result: {
              line: 2,
              value: "Suite 200",
            },
          },
          {
            type: "dimension",
            score: 0.4792571878834418,
            text: "200 in",
            start_index: 106,
            end_index: 111,
            result: {
              unit: "inch",
              value: 200,
            },
          },
          {
            type: "city_locality",
            score: 0.9805313966503588,
            text: "austin",
            start_index: 113,
            end_index: 118,
            result: {
              value: "Austin",
            },
          },
          {
            type: "state_province",
            score: 0.6082904353940255,
            text: "tx",
            start_index: 121,
            end_index: 122,
            result: {
              name: "Texas",
              value: "TX",
            },
          },
          {
            type: "postal_code",
            score: 0.9519646137063122,
            text: 78652,
            start_index: 124,
            end_index: 128,
            result: {
              value: 78652,
            },
          },
          {
            type: "carrier",
            score: 0.9519646137063122,
            text: "USPS",
            start_index: 150,
            end_index: 153,
            result: {
              name: "Stamps.com",
              value: "se-118608",
            },
          },
          {
            type: "service",
            score: 0.6082904353940255,
            text: "first class",
            start_index: 155,
            end_index: 165,
            result: {
              name: "USPS First Class Mail",
              value: "usps_first_class_mail",
            },
          },
          {
            type: "number",
            score: 0.9805313966503588,
            text: "first",
            start_index: 155,
            end_index: 159,
            result: {
              type: "ordinal",
              value: 1,
            },
          },
          {
            type: "company",
            score: 0.9519646137063122,
            text: "adult signature",
            start_index: 182,
            end_index: 196,
            result: {
              value: "Adult Signature",
            },
          },
          {
            type: "delivery_confirmation",
            score: 0.8530163983409642,
            text: "adult signature",
            start_index: 182,
            end_index: 196,
            result: {
              name: "Adult Signature",
              value: "adult_signature",
            },
          },
          {
            type: "insurance",
            score: 0.8530163983409642,
            text: "insured for $400",
            start_index: 219,
            end_index: 234,
            result: {
              value: 400,
              unit: "USD",
            },
          },
          {
            type: "insured_value",
            score: 1,
            text: "$400",
            start_index: 231,
            end_index: 234,
            result: {
              unit: "USD",
              value: 400,
            },
          },
        ],
      }

      request = stub_request(
        :put,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.shipments.parse_shipping_info}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = shipments.parse_shipping_info(params: params)

      assert_requested(request, times: 1)

      expect(response.score).to(eq(expected_response[:score]))
      expect(response.shipment.carrier_id).to(eq(expected_response[:shipment][:carrier_id]))
      expect(response.shipment.service_code).to(eq(expected_response[:shipment][:service_code]))
      expect(response.shipment.confirmation).to(eq(expected_response[:shipment][:confirmation]))

      expect(response.shipment.ship_to.name).to(eq(expected_response[:shipment][:ship_to][:name]))
      expect(response.shipment.ship_to.phone).to(eq(expected_response[:shipment][:ship_to][:phone]))
      expect(response.shipment.ship_to.company_name).to(eq(expected_response[:shipment][:ship_to][:company_name]))
      expect(response.shipment.ship_to.address_line1).to(eq(expected_response[:shipment][:ship_to][:address_line1]))
      expect(response.shipment.ship_to.address_line2).to(eq(expected_response[:shipment][:ship_to][:address_line2]))
      expect(response.shipment.ship_to.address_line3).to(eq(expected_response[:shipment][:ship_to][:address_line3]))
      expect(response.shipment.ship_to.city_locality).to(eq(expected_response[:shipment][:ship_to][:city_locality]))
      expect(response.shipment.ship_to.state_province).to(eq(expected_response[:shipment][:ship_to][:state_province]))
      expect(response.shipment.ship_to.postal_code).to(eq(expected_response[:shipment][:ship_to][:postal_code]))
      expect(response.shipment.ship_to.country_code).to(eq(expected_response[:shipment][:ship_to][:country_code]))
      expect(response.shipment.ship_to.address_residential_indicator).to(eq(expected_response[:shipment][:ship_to][:address_residential_indicator]))

      expect(response.shipment.packages[0].weight.value).to(eq(expected_response[:shipment][:packages][0][:weight][:value]))
      expect(response.shipment.packages[0].weight.unit).to(eq(expected_response[:shipment][:packages][0][:weight][:unit]))
      expect(response.shipment.packages[0].dimensions["unit"]).to(eq(expected_response[:shipment][:packages][0][:dimensions][:unit]))
      expect(response.shipment.packages[0].dimensions["length"]).to(eq(expected_response[:shipment][:packages][0][:dimensions][:length]))
      expect(response.shipment.packages[0].dimensions["width"]).to(eq(expected_response[:shipment][:packages][0][:dimensions][:width]))
      expect(response.shipment.packages[0].dimensions["height"]).to(eq(expected_response[:shipment][:packages][0][:dimensions][:height]))
      expect(response.shipment.packages[0].insured_value.currency).to(eq(expected_response[:shipment][:packages][0][:insured_value][:currency]))
      expect(response.shipment.packages[0].insured_value.amount).to(eq(expected_response[:shipment][:packages][0][:insured_value][:amount]))

      expect(response.entities[0].type).to(eq(expected_response[:entities][0][:type]))
      expect(response.entities[0].score).to(eq(expected_response[:entities][0][:score]))
      expect(response.entities[0].text).to(eq(expected_response[:entities][0][:text]))
      expect(response.entities[0].start_index).to(eq(expected_response[:entities][0][:start_index]))
      expect(response.entities[0].end_index).to(eq(expected_response[:entities][0][:end_index]))
      expect(response.entities[0].result.value).to(eq(expected_response[:entities][0][:result][:value]))
      expect(response.entities[0].result.unit).to(eq(expected_response[:entities][0][:result][:unit]))

      expect(response.entities[1].type).to(eq(expected_response[:entities][1][:type]))
      expect(response.entities[1].score).to(eq(expected_response[:entities][1][:score]))
      expect(response.entities[1].text).to(eq(expected_response[:entities][1][:text]))
      expect(response.entities[1].start_index).to(eq(expected_response[:entities][1][:start_index]))
      expect(response.entities[1].end_index).to(eq(expected_response[:entities][1][:end_index]))
      expect(response.entities[1].result["length"]).to(eq(expected_response[:entities][1][:result][:length]))
      expect(response.entities[1].result["width"]).to(eq(expected_response[:entities][1][:result][:width]))
      expect(response.entities[1].result["height"]).to(eq(expected_response[:entities][1][:result][:height]))
      expect(response.entities[1].result["unit"]).to(eq(expected_response[:entities][1][:result][:unit]))

      expect(response.entities[2].type).to(eq(expected_response[:entities][2][:type]))
      expect(response.entities[2].score).to(eq(expected_response[:entities][2][:score]))
      expect(response.entities[2].text).to(eq(expected_response[:entities][2][:text]))
      expect(response.entities[2].start_index).to(eq(expected_response[:entities][2][:start_index]))
      expect(response.entities[2].end_index).to(eq(expected_response[:entities][2][:end_index]))
      expect(response.entities[2].result.unit).to(eq(expected_response[:entities][2][:result][:unit]))
      expect(response.entities[2].result.value).to(eq(expected_response[:entities][2][:result][:value]))

      expect(response.entities[3].type).to(eq(expected_response[:entities][3][:type]))
      expect(response.entities[3].score).to(eq(expected_response[:entities][3][:score]))
      expect(response.entities[3].text).to(eq(expected_response[:entities][3][:text]))
      expect(response.entities[3].start_index).to(eq(expected_response[:entities][3][:start_index]))
      expect(response.entities[3].end_index).to(eq(expected_response[:entities][3][:end_index]))
      expect(response.entities[3].result.direction).to(eq(expected_response[:entities][3][:result][:direction]))
      expect(response.entities[3].result.name).to(eq(expected_response[:entities][3][:result][:name]))
      expect(response.entities[3].result.company_name).to(eq(expected_response[:entities][3][:result][:company_name]))
      expect(response.entities[3].result.address_line1).to(eq(expected_response[:entities][3][:result][:address_line1]))
      expect(response.entities[3].result.address_line2).to(eq(expected_response[:entities][3][:result][:address_line2]))
      expect(response.entities[3].result.city_locality).to(eq(expected_response[:entities][3][:result][:city_locality]))
      expect(response.entities[3].result.state_province).to(eq(expected_response[:entities][3][:result][:state_province]))
      expect(response.entities[3].result.postal_code).to(eq(expected_response[:entities][3][:result][:postal_code]))

      expect(response.entities[4].type).to(eq(expected_response[:entities][4][:type]))
      expect(response.entities[4].score).to(eq(expected_response[:entities][4][:score]))
      expect(response.entities[4].text).to(eq(expected_response[:entities][4][:text]))
      expect(response.entities[4].start_index).to(eq(expected_response[:entities][4][:start_index]))
      expect(response.entities[4].end_index).to(eq(expected_response[:entities][4][:end_index]))
      expect(response.entities[4].result.value).to(eq(expected_response[:entities][4][:result][:value]))

      expect(response.entities[5].type).to(eq(expected_response[:entities][5][:type]))
      expect(response.entities[5].score).to(eq(expected_response[:entities][5][:score]))
      expect(response.entities[5].text).to(eq(expected_response[:entities][5][:text]))
      expect(response.entities[5].start_index).to(eq(expected_response[:entities][5][:start_index]))
      expect(response.entities[5].end_index).to(eq(expected_response[:entities][5][:end_index]))
      expect(response.entities[5].result.line).to(eq(expected_response[:entities][5][:result][:line]))
      expect(response.entities[5].result.value).to(eq(expected_response[:entities][5][:result][:value]))

      expect(response.entities[6].type).to(eq(expected_response[:entities][6][:type]))
      expect(response.entities[6].score).to(eq(expected_response[:entities][6][:score]))
      expect(response.entities[6].text).to(eq(expected_response[:entities][6][:text]))
      expect(response.entities[6].start_index).to(eq(expected_response[:entities][6][:start_index]))
      expect(response.entities[6].end_index).to(eq(expected_response[:entities][6][:end_index]))
      expect(response.entities[6].result.type).to(eq(expected_response[:entities][6][:result][:type]))
      expect(response.entities[6].result.value).to(eq(expected_response[:entities][6][:result][:value]))

      expect(response.entities[7].type).to(eq(expected_response[:entities][7][:type]))
      expect(response.entities[7].score).to(eq(expected_response[:entities][7][:score]))
      expect(response.entities[7].text).to(eq(expected_response[:entities][7][:text]))
      expect(response.entities[7].start_index).to(eq(expected_response[:entities][7][:start_index]))
      expect(response.entities[7].end_index).to(eq(expected_response[:entities][7][:end_index]))
      expect(response.entities[7].result.line).to(eq(expected_response[:entities][7][:result][:line]))
      expect(response.entities[7].result.value).to(eq(expected_response[:entities][7][:result][:value]))

      expect(response.entities[8].type).to(eq(expected_response[:entities][8][:type]))
      expect(response.entities[8].score).to(eq(expected_response[:entities][8][:score]))
      expect(response.entities[8].text).to(eq(expected_response[:entities][8][:text]))
      expect(response.entities[8].start_index).to(eq(expected_response[:entities][8][:start_index]))
      expect(response.entities[8].end_index).to(eq(expected_response[:entities][8][:end_index]))
      expect(response.entities[8].result.unit).to(eq(expected_response[:entities][8][:result][:unit]))
      expect(response.entities[8].result.value).to(eq(expected_response[:entities][8][:result][:value]))

      expect(response.entities[9].type).to(eq(expected_response[:entities][9][:type]))
      expect(response.entities[9].score).to(eq(expected_response[:entities][9][:score]))
      expect(response.entities[9].text).to(eq(expected_response[:entities][9][:text]))
      expect(response.entities[9].start_index).to(eq(expected_response[:entities][9][:start_index]))
      expect(response.entities[9].end_index).to(eq(expected_response[:entities][9][:end_index]))
      expect(response.entities[9].result.value).to(eq(expected_response[:entities][9][:result][:value]))

      expect(response.entities[10].type).to(eq(expected_response[:entities][10][:type]))
      expect(response.entities[10].score).to(eq(expected_response[:entities][10][:score]))
      expect(response.entities[10].text).to(eq(expected_response[:entities][10][:text]))
      expect(response.entities[10].start_index).to(eq(expected_response[:entities][10][:start_index]))
      expect(response.entities[10].end_index).to(eq(expected_response[:entities][10][:end_index]))
      expect(response.entities[10].result.name).to(eq(expected_response[:entities][10][:result][:name]))
      expect(response.entities[10].result.value).to(eq(expected_response[:entities][10][:result][:value]))

      expect(response.entities[11].type).to(eq(expected_response[:entities][11][:type]))
      expect(response.entities[11].score).to(eq(expected_response[:entities][11][:score]))
      expect(response.entities[11].text).to(eq(expected_response[:entities][11][:text]))
      expect(response.entities[11].start_index).to(eq(expected_response[:entities][11][:start_index]))
      expect(response.entities[11].end_index).to(eq(expected_response[:entities][11][:end_index]))
      expect(response.entities[11].result.value).to(eq(expected_response[:entities][11][:result][:value]))

      expect(response.entities[12].type).to(eq(expected_response[:entities][12][:type]))
      expect(response.entities[12].score).to(eq(expected_response[:entities][12][:score]))
      expect(response.entities[12].text).to(eq(expected_response[:entities][12][:text]))
      expect(response.entities[12].start_index).to(eq(expected_response[:entities][12][:start_index]))
      expect(response.entities[12].end_index).to(eq(expected_response[:entities][12][:end_index]))
      expect(response.entities[12].result.name).to(eq(expected_response[:entities][12][:result][:name]))
      expect(response.entities[12].result.value).to(eq(expected_response[:entities][12][:result][:value]))

      expect(response.entities[13].type).to(eq(expected_response[:entities][13][:type]))
      expect(response.entities[13].score).to(eq(expected_response[:entities][13][:score]))
      expect(response.entities[13].text).to(eq(expected_response[:entities][13][:text]))
      expect(response.entities[13].start_index).to(eq(expected_response[:entities][13][:start_index]))
      expect(response.entities[13].end_index).to(eq(expected_response[:entities][13][:end_index]))
      expect(response.entities[13].result.name).to(eq(expected_response[:entities][13][:result][:name]))
      expect(response.entities[13].result.value).to(eq(expected_response[:entities][13][:result][:value]))

      expect(response.entities[14].type).to(eq(expected_response[:entities][14][:type]))
      expect(response.entities[14].score).to(eq(expected_response[:entities][14][:score]))
      expect(response.entities[14].text).to(eq(expected_response[:entities][14][:text]))
      expect(response.entities[14].start_index).to(eq(expected_response[:entities][14][:start_index]))
      expect(response.entities[14].end_index).to(eq(expected_response[:entities][14][:end_index]))
      expect(response.entities[14].result.type).to(eq(expected_response[:entities][14][:result][:type]))
      expect(response.entities[14].result.value).to(eq(expected_response[:entities][14][:result][:value]))

      expect(response.entities[15].type).to(eq(expected_response[:entities][15][:type]))
      expect(response.entities[15].score).to(eq(expected_response[:entities][15][:score]))
      expect(response.entities[15].text).to(eq(expected_response[:entities][15][:text]))
      expect(response.entities[15].start_index).to(eq(expected_response[:entities][15][:start_index]))
      expect(response.entities[15].end_index).to(eq(expected_response[:entities][15][:end_index]))
      expect(response.entities[15].result.value).to(eq(expected_response[:entities][15][:result][:value]))

      expect(response.entities[16].type).to(eq(expected_response[:entities][16][:type]))
      expect(response.entities[16].score).to(eq(expected_response[:entities][16][:score]))
      expect(response.entities[16].text).to(eq(expected_response[:entities][16][:text]))
      expect(response.entities[16].start_index).to(eq(expected_response[:entities][16][:start_index]))
      expect(response.entities[16].end_index).to(eq(expected_response[:entities][16][:end_index]))
      expect(response.entities[16].result.name).to(eq(expected_response[:entities][16][:result][:name]))
      expect(response.entities[16].result.value).to(eq(expected_response[:entities][16][:result][:value]))

      expect(response.entities[17].type).to(eq(expected_response[:entities][17][:type]))
      expect(response.entities[17].score).to(eq(expected_response[:entities][17][:score]))
      expect(response.entities[17].text).to(eq(expected_response[:entities][17][:text]))
      expect(response.entities[17].start_index).to(eq(expected_response[:entities][17][:start_index]))
      expect(response.entities[17].end_index).to(eq(expected_response[:entities][17][:end_index]))
      expect(response.entities[17].result.unit).to(eq(expected_response[:entities][17][:result][:unit]))
      expect(response.entities[17].result.value).to(eq(expected_response[:entities][17][:result][:value]))

      expect(response.entities[18].type).to(eq(expected_response[:entities][18][:type]))
      expect(response.entities[18].score).to(eq(expected_response[:entities][18][:score]))
      expect(response.entities[18].text).to(eq(expected_response[:entities][18][:text]))
      expect(response.entities[18].start_index).to(eq(expected_response[:entities][18][:start_index]))
      expect(response.entities[18].end_index).to(eq(expected_response[:entities][18][:end_index]))
      expect(response.entities[18].result.unit).to(eq(expected_response[:entities][18][:result][:unit]))
      expect(response.entities[18].result.value).to(eq(expected_response[:entities][18][:result][:value]))
    end
  end

  context "Get Shipment By ID" do
    it "should get shipment by id" do
      shipment_id = "se-28529731"
      params = {}
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
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.shipments.root}/#{shipment_id}"
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

      response = shipments.shipment_by_id(shipment_id: shipment_id, params: params)

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
    end
  end

  context "Update Shipment By ID" do
    it "should update shipment by id" do
      shipment_id = "se-28529731"
      params = {
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
        errors: [],
        address_validation: {
          status: "unverified",
          original_address: {
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
          matched_address: {
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
          messages: [],
        },
      }

      request = stub_request(
        :put,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.shipments.root}/#{shipment_id}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = shipments.update_shipment_by_id(shipment_id: shipment_id, params: params)

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

      expect(response.errors).to(eq(expected_response[:errors]))

      expect(response.address_validation.status).to(eq(expected_response[:address_validation][:status]))
      expect(response.address_validation.original_address.name).to(eq(expected_response[:address_validation][:original_address][:name]))
      expect(response.address_validation.original_address.phone).to(eq(expected_response[:address_validation][:original_address][:phone]))
      expect(response.address_validation.original_address.company_name).to(eq(expected_response[:address_validation][:original_address][:company_name]))
      expect(response.address_validation.original_address.address_line1).to(eq(expected_response[:address_validation][:original_address][:address_line1]))
      expect(response.address_validation.original_address.address_line2).to(eq(expected_response[:address_validation][:original_address][:address_line2]))
      expect(response.address_validation.original_address.address_line3).to(eq(expected_response[:address_validation][:original_address][:address_line3]))
      expect(response.address_validation.original_address.city_locality).to(eq(expected_response[:address_validation][:original_address][:city_locality]))
      expect(response.address_validation.original_address.state_province).to(eq(expected_response[:address_validation][:original_address][:state_province]))
      expect(response.address_validation.original_address.postal_code).to(eq(expected_response[:address_validation][:original_address][:postal_code]))
      expect(response.address_validation.original_address.country_code).to(eq(expected_response[:address_validation][:original_address][:country_code]))
      expect(response.address_validation.original_address.address_residential_indicator).to(eq(expected_response[:address_validation][:original_address][:address_residential_indicator]))
      expect(response.address_validation.matched_address.name).to(eq(expected_response[:address_validation][:matched_address][:name]))
      expect(response.address_validation.matched_address.phone).to(eq(expected_response[:address_validation][:matched_address][:phone]))
      expect(response.address_validation.matched_address.company_name).to(eq(expected_response[:address_validation][:matched_address][:company_name]))
      expect(response.address_validation.matched_address.address_line1).to(eq(expected_response[:address_validation][:matched_address][:address_line1]))
      expect(response.address_validation.matched_address.address_line2).to(eq(expected_response[:address_validation][:matched_address][:address_line2]))
      expect(response.address_validation.matched_address.address_line3).to(eq(expected_response[:address_validation][:matched_address][:address_line3]))
      expect(response.address_validation.matched_address.city_locality).to(eq(expected_response[:address_validation][:matched_address][:city_locality]))
      expect(response.address_validation.matched_address.state_province).to(eq(expected_response[:address_validation][:matched_address][:state_province]))
      expect(response.address_validation.matched_address.postal_code).to(eq(expected_response[:address_validation][:matched_address][:postal_code]))
      expect(response.address_validation.matched_address.country_code).to(eq(expected_response[:address_validation][:matched_address][:country_code]))
      expect(response.address_validation.matched_address.address_residential_indicator).to(eq(expected_response[:address_validation][:matched_address][:address_residential_indicator]))
      expect(response.address_validation.messages).to(eq(expected_response[:address_validation][:messages]))
    end
  end

  context "Cancel Shipment By ID" do
    it "should cancel shipment by id" do
      shipment_id = "se-28529731"
      params = {}
      expected_response = {}

      request = stub_request(
        :put,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.shipments.root}/#{shipment_id}/cancel"
      ).with(body: params).to_return(status: 204, body: expected_response.to_json)

      response = shipments.cancel_shipment_by_id(shipment_id: shipment_id, params: params)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end

  context "Get Shipment Rates" do
    it "should get shipment rates" do
      shipment_id = "se-28529731"
      params = {}
      expected_response = {
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
            ship_date: "2022-11-07T08:55:13Z",
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
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.shipments.root}/#{shipment_id}/rates"
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

      response = shipments.shipment_rates(shipment_id: shipment_id, params: params)

      assert_requested(request, times: 1)

      expect(response.rates[0].rate_id).to(eq(expected_response[:rates][0][:rate_id]))
      expect(response.rates[0].rate_type).to(eq(expected_response[:rates][0][:rate_type]))
      expect(response.rates[0].carrier_id).to(eq(expected_response[:rates][0][:carrier_id]))

      expect(response.rates[0].shipping_amount.currency).to(eq(expected_response[:rates][0][:shipping_amount][:currency]))
      expect(response.rates[0].shipping_amount.amount).to(eq(expected_response[:rates][0][:shipping_amount][:amount]))

      expect(response.rates[0].insurance_amount.currency).to(eq(expected_response[:rates][0][:insurance_amount][:currency]))
      expect(response.rates[0].insurance_amount.amount).to(eq(expected_response[:rates][0][:insurance_amount][:amount]))

      expect(response.rates[0].confirmation_amount.currency).to(eq(expected_response[:rates][0][:confirmation_amount][:currency]))
      expect(response.rates[0].confirmation_amount.amount).to(eq(expected_response[:rates][0][:confirmation_amount][:amount]))

      expect(response.rates[0].other_amount.currency).to(eq(expected_response[:rates][0][:other_amount][:currency]))
      expect(response.rates[0].other_amount.amount).to(eq(expected_response[:rates][0][:other_amount][:amount]))

      expect(response.rates[0].tax_amount.currency).to(eq(expected_response[:rates][0][:tax_amount][:currency]))
      expect(response.rates[0].tax_amount.amount).to(eq(expected_response[:rates][0][:tax_amount][:amount]))

      expect(response.rates[0].zone).to(eq(expected_response[:rates][0][:zone]))
      expect(response.rates[0].package_type).to(eq(expected_response[:rates][0][:package_type]))
      expect(response.rates[0].delivery_days).to(eq(expected_response[:rates][0][:delivery_days]))
      expect(response.rates[0].guaranteed_service).to(eq(expected_response[:rates][0][:guaranteed_service]))
      expect(response.rates[0].estimated_delivery_date).to(eq(expected_response[:rates][0][:estimated_delivery_date]))
      expect(response.rates[0].carrier_delivery_days).to(eq(expected_response[:rates][0][:carrier_delivery_days]))
      expect(response.rates[0].ship_date).to(eq(expected_response[:rates][0][:ship_date]))
      expect(response.rates[0].negotiated_rate).to(eq(expected_response[:rates][0][:negotiated_rate]))
      expect(response.rates[0].service_type).to(eq(expected_response[:rates][0][:service_type]))
      expect(response.rates[0].service_code).to(eq(expected_response[:rates][0][:service_code]))
      expect(response.rates[0].trackable).to(eq(expected_response[:rates][0][:trackable]))
      expect(response.rates[0].carrier_code).to(eq(expected_response[:rates][0][:carrier_code]))
      expect(response.rates[0].carrier_nickname).to(eq(expected_response[:rates][0][:carrier_nickname]))
      expect(response.rates[0].carrier_friendly_name).to(eq(expected_response[:rates][0][:carrier_friendly_name]))
      expect(response.rates[0].validation_status).to(eq(expected_response[:rates][0][:validation_status]))
      expect(response.rates[0].warning_messages).to(eq(expected_response[:rates][0][:warning_messages]))
      expect(response.rates[0].error_messages).to(eq(expected_response[:rates][0][:error_messages]))

      expect(response.invalid_rates).to(eq(expected_response[:invalid_rates]))
      expect(response.rate_request_id).to(eq(expected_response[:rate_request_id]))
      expect(response.shipment_id).to(eq(expected_response[:shipment_id]))
      expect(response.created_at).to(eq(expected_response[:created_at]))
      expect(response.status).to(eq(expected_response[:status]))
      expect(response.errors).to(eq(expected_response[:errors]))
    end
  end

  context "Add Tag to Shipment" do
    it "should add tag to shipment" do
      shipment_id = "se-28529731"
      tag_name = "Fragile"
      params = {}
      expected_response = {
        shipment_id: "se-28529731",
        tag: {
          name: "Fragile",
        },
      }

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.shipments.root}/#{shipment_id}/tags/#{tag_name}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = shipments.add_tag_to_shipment(shipment_id: shipment_id, tag_name: tag_name, params: params)

      assert_requested(request, times: 1)

      expect(response.shipment_id).to(eq(expected_response[:shipment_id]))
      expect(response.tag.name).to(eq(expected_response[:tag][:name]))
    end
  end

  context "Remove Tag to Shipment" do
    it "should remove tag to shipment" do
      shipment_id = "se-28529731"
      tag_name = "Fragile"
      params = {}
      expected_response = {}

      request = stub_request(
        :delete,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.shipments.root}/#{shipment_id}/tags/#{tag_name}"
      ).with(body: params).to_return(status: 402, body: expected_response.to_json)

      response = shipments.remove_tag_to_shipment(shipment_id: shipment_id, tag_name: tag_name, params: params)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end
end
