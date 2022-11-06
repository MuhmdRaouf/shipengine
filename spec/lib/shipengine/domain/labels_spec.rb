# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::Labels) do
  let(:labels) { ShipEngine::Domain::Labels.new }

  context "List labels" do
    it "should list labels" do
      params = {}
      expected_response = {
        labels: [
          {
            label_id: "se-28529731",
            status: "processing",
            shipment_id: "se-28529731",
            ship_date: "2018-09-23T00:00:00.000Z",
            created_at: "2018-09-23T15:00:00.000Z",
            shipment_cost: {
              currency: "string",
              amount: 0,
            },
            insurance_cost: {
              currency: "string",
              amount: 0,
            },
            tracking_number: "782758401696",
            is_return_label: true,
            rma_number: "string",
            is_international: true,
            batch_id: "se-28529731",
            carrier_id: "se-28529731",
            charge_event: "carrier_default",
            service_code: "usps_first_class_mail",
            package_code: "small_flat_rate_box",
            voided: true,
            voided_at: "2018-09-23T15:00:00.000Z",
            label_format: "pdf",
            display_scheme: "label",
            label_layout: "4x6",
            trackable: true,
            label_image_id: "img_DtBXupDBxREpHnwEXhTfgK",
            carrier_code: "dhl_express",
            tracking_status: "unknown",
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
            insurance_claim: {
              href: "https://api.shipengine.com/v1/labels/se-28529731",
              type: "string",
            },
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
          },
        ],
        total: 2750,
        page: 1,
        pages: 4,
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
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.labels.root}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = labels.list_labels(params: params)

      assert_requested(request, times: 1)

      expect(response.labels[0].label_id).to(eq(expected_response[:labels][0][:label_id]))
      expect(response.labels[0].status).to(eq(expected_response[:labels][0][:status]))
      expect(response.labels[0].shipment_id).to(eq(expected_response[:labels][0][:shipment_id]))
      expect(response.labels[0].ship_date).to(eq(expected_response[:labels][0][:ship_date]))
      expect(response.labels[0].created_at).to(eq(expected_response[:labels][0][:created_at]))
      expect(response.labels[0].tracking_number).to(eq(expected_response[:labels][0][:tracking_number]))
      expect(response.labels[0].is_return_label).to(eq(expected_response[:labels][0][:is_return_label]))
      expect(response.labels[0].rma_number).to(eq(expected_response[:labels][0][:rma_number]))
      expect(response.labels[0].is_international).to(eq(expected_response[:labels][0][:is_international]))
      expect(response.labels[0].batch_id).to(eq(expected_response[:labels][0][:batch_id]))
      expect(response.labels[0].carrier_id).to(eq(expected_response[:labels][0][:carrier_id]))
      expect(response.labels[0].charge_event).to(eq(expected_response[:labels][0][:charge_event]))
      expect(response.labels[0].service_code).to(eq(expected_response[:labels][0][:service_code]))
      expect(response.labels[0].package_code).to(eq(expected_response[:labels][0][:package_code]))
      expect(response.labels[0].voided).to(eq(expected_response[:labels][0][:voided]))
      expect(response.labels[0].voided_at).to(eq(expected_response[:labels][0][:voided_at]))
      expect(response.labels[0].label_format).to(eq(expected_response[:labels][0][:label_format]))
      expect(response.labels[0].display_scheme).to(eq(expected_response[:labels][0][:display_scheme]))
      expect(response.labels[0].label_layout).to(eq(expected_response[:labels][0][:label_layout]))
      expect(response.labels[0].trackable).to(eq(expected_response[:labels][0][:trackable]))
      expect(response.labels[0].label_image_id).to(eq(expected_response[:labels][0][:label_image_id]))
      expect(response.labels[0].carrier_code).to(eq(expected_response[:labels][0][:carrier_code]))
      expect(response.labels[0].tracking_status).to(eq(expected_response[:labels][0][:tracking_status]))

      expect(response.labels[0].shipment_cost.currency).to(eq(expected_response[:labels][0][:shipment_cost][:currency]))
      expect(response.labels[0].shipment_cost.amount).to(eq(expected_response[:labels][0][:shipment_cost][:amount]))

      expect(response.labels[0].insurance_cost.currency).to(eq(expected_response[:labels][0][:insurance_cost][:currency]))
      expect(response.labels[0].insurance_cost.amount).to(eq(expected_response[:labels][0][:insurance_cost][:amount]))

      expect(response.labels[0].label_download.href).to(eq(expected_response[:labels][0][:label_download][:href]))
      expect(response.labels[0].label_download.pdf).to(eq(expected_response[:labels][0][:label_download][:pdf]))

      expect(response.labels[0].form_download.href).to(eq(expected_response[:labels][0][:form_download][:href]))

      expect(response.labels[0].insurance_claim.href).to(eq(expected_response[:labels][0][:insurance_claim][:href]))

      expect(response.labels[0].packages[0].package_id).to(eq(expected_response[:labels][0][:packages][0][:package_id]))
      expect(response.labels[0].packages[0].package_code).to(eq(expected_response[:labels][0][:packages][0][:package_code]))

      expect(response.labels[0].packages[0].weight.value).to(eq(expected_response[:labels][0][:packages][0][:weight][:value]))
      expect(response.labels[0].packages[0].weight.unit).to(eq(expected_response[:labels][0][:packages][0][:weight][:unit]))

      expect(response.labels[0].packages[0].dimensions["unit"]).to(eq(expected_response[:labels][0][:packages][0][:dimensions][:unit]))
      expect(response.labels[0].packages[0].dimensions["length"]).to(eq(expected_response[:labels][0][:packages][0][:dimensions][:length]))
      expect(response.labels[0].packages[0].dimensions["width"]).to(eq(expected_response[:labels][0][:packages][0][:dimensions][:width]))
      expect(response.labels[0].packages[0].dimensions["height"]).to(eq(expected_response[:labels][0][:packages][0][:dimensions][:height]))

      expect(response.labels[0].packages[0].insured_value["0"].currency).to(eq(expected_response[:labels][0][:packages][0][:insured_value]["0".to_sym][:currency]))
      expect(response.labels[0].packages[0].insured_value["0"].amount).to(eq(expected_response[:labels][0][:packages][0][:insured_value]["0".to_sym][:amount]))

      expect(response.labels[0].packages[0].tracking_number).to(eq(expected_response[:labels][0][:packages][0][:tracking_number]))

      expect(response.labels[0].packages[0].label_messages.reference1).to(eq(expected_response[:labels][0][:packages][0][:label_messages][:reference1]))
      expect(response.labels[0].packages[0].label_messages.reference2).to(eq(expected_response[:labels][0][:packages][0][:label_messages][:reference2]))
      expect(response.labels[0].packages[0].label_messages.reference3).to(eq(expected_response[:labels][0][:packages][0][:label_messages][:reference3]))

      expect(response.labels[0].packages[0].external_package_id).to(eq(expected_response[:labels][0][:packages][0][:external_package_id]))

      expect(response.labels[0].packages[0].label_download.href).to(eq(expected_response[:labels][0][:packages][0][:label_download][:href]))
      expect(response.labels[0].packages[0].label_download.pdf).to(eq(expected_response[:labels][0][:packages][0][:label_download][:pdf]))

      expect(response.labels[0].packages[0].form_download.href).to(eq(expected_response[:labels][0][:packages][0][:form_download][:href]))

      expect(response.labels[0].packages[0].sequence).to(eq(expected_response[:labels][0][:packages][0][:sequence]))

      expect(response.total).to(eq(expected_response[:total]))
      expect(response.page).to(eq(expected_response[:page]))
      expect(response.pages).to(eq(expected_response[:pages]))
      expect(response.links["first"]["href"]).to(eq(expected_response[:links][:first][:href]))
      expect(response.links["last"]["href"]).to(eq(expected_response[:links][:last][:href]))
      expect(response.links["prev"]["href"]).to(eq(expected_response[:links][:prev][:href]))
      expect(response.links["next"]["href"]).to(eq(expected_response[:links][:next][:href]))
    end
  end

  context "Purchase Label" do
    it "should purchase label" do
      params = {
        ship_to_service_point_id: "614940",
        ship_from_service_point_id: "614940",
        shipment: {
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
        is_return_label: true,
        rma_number: "string",
        charge_event: "carrier_default",
        outbound_label_id: "se-28529731",
        test_label: false,
        validate_address: "no_validation",
        label_download_type: "url",
        label_format: "pdf",
        display_scheme: "label",
        label_layout: "4x6",
        label_image_id: "img_DtBXupDBxREpHnwEXhTfgK",
      }

      expected_response = {
        label_id: "se-28529731",
        status: "processing",
        shipment_id: "se-28529731",
        ship_date: "2018-09-23T00:00:00.000Z",
        created_at: "2018-09-23T15:00:00.000Z",
        shipment_cost: {
          currency: "string",
          amount: 0,
        },
        insurance_cost: {
          currency: "string",
          amount: 0,
        },
        tracking_number: "782758401696",
        is_return_label: true,
        rma_number: "string",
        is_international: true,
        batch_id: "se-28529731",
        carrier_id: "se-28529731",
        charge_event: "carrier_default",
        service_code: "usps_first_class_mail",
        package_code: "small_flat_rate_box",
        voided: true,
        voided_at: "2018-09-23T15:00:00.000Z",
        label_format: "pdf",
        display_scheme: "label",
        label_layout: "4x6",
        trackable: true,
        label_image_id: "img_DtBXupDBxREpHnwEXhTfgK",
        carrier_code: "dhl_express",
        tracking_status: "unknown",
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
        insurance_claim: {
          href: "https://api.shipengine.com/v1/labels/se-28529731",
          type: "string",
        },
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
      }

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.labels.root}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = labels.purchase_label(params: params)

      assert_requested(request, times: 1)

      expect(response.label_id).to(eq(expected_response[:label_id]))
      expect(response.status).to(eq(expected_response[:status]))
      expect(response.shipment_id).to(eq(expected_response[:shipment_id]))
      expect(response.ship_date).to(eq(expected_response[:ship_date]))
      expect(response.created_at).to(eq(expected_response[:created_at]))
      expect(response.tracking_number).to(eq(expected_response[:tracking_number]))
      expect(response.is_return_label).to(eq(expected_response[:is_return_label]))
      expect(response.rma_number).to(eq(expected_response[:rma_number]))
      expect(response.is_international).to(eq(expected_response[:is_international]))
      expect(response.batch_id).to(eq(expected_response[:batch_id]))
      expect(response.carrier_id).to(eq(expected_response[:carrier_id]))
      expect(response.charge_event).to(eq(expected_response[:charge_event]))
      expect(response.service_code).to(eq(expected_response[:service_code]))
      expect(response.package_code).to(eq(expected_response[:package_code]))
      expect(response.voided).to(eq(expected_response[:voided]))
      expect(response.voided_at).to(eq(expected_response[:voided_at]))
      expect(response.label_format).to(eq(expected_response[:label_format]))
      expect(response.display_scheme).to(eq(expected_response[:display_scheme]))
      expect(response.label_layout).to(eq(expected_response[:label_layout]))
      expect(response.trackable).to(eq(expected_response[:trackable]))
      expect(response.label_image_id).to(eq(expected_response[:label_image_id]))
      expect(response.carrier_code).to(eq(expected_response[:carrier_code]))
      expect(response.tracking_status).to(eq(expected_response[:tracking_status]))

      expect(response.shipment_cost.currency).to(eq(expected_response[:shipment_cost][:currency]))
      expect(response.shipment_cost.amount).to(eq(expected_response[:shipment_cost][:amount]))

      expect(response.insurance_cost.currency).to(eq(expected_response[:insurance_cost][:currency]))
      expect(response.insurance_cost.amount).to(eq(expected_response[:insurance_cost][:amount]))

      expect(response.label_download.href).to(eq(expected_response[:label_download][:href]))
      expect(response.label_download.pdf).to(eq(expected_response[:label_download][:pdf]))

      expect(response.form_download.href).to(eq(expected_response[:form_download][:href]))

      expect(response.insurance_claim.href).to(eq(expected_response[:insurance_claim][:href]))

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

      expect(response.packages[0].tracking_number).to(eq(expected_response[:packages][0][:tracking_number]))

      expect(response.packages[0].label_messages.reference1).to(eq(expected_response[:packages][0][:label_messages][:reference1]))
      expect(response.packages[0].label_messages.reference2).to(eq(expected_response[:packages][0][:label_messages][:reference2]))
      expect(response.packages[0].label_messages.reference3).to(eq(expected_response[:packages][0][:label_messages][:reference3]))

      expect(response.packages[0].external_package_id).to(eq(expected_response[:packages][0][:external_package_id]))

      expect(response.packages[0].label_download.href).to(eq(expected_response[:packages][0][:label_download][:href]))
      expect(response.packages[0].label_download.pdf).to(eq(expected_response[:packages][0][:label_download][:pdf]))

      expect(response.packages[0].form_download.href).to(eq(expected_response[:packages][0][:form_download][:href]))

      expect(response.packages[0].sequence).to(eq(expected_response[:packages][0][:sequence]))
    end
  end

  context "Get Label By External Shipment ID" do
    it "should get label by external shipment id" do
      shipment_id = "0bcb569d-1727-4ff9-ab49-b2fec0cee5ae"
      params = {}
      expected_response = {
        label_id: "se-28529731",
        status: "processing",
        shipment_id: "se-28529731",
        ship_date: "2018-09-23T00:00:00.000Z",
        created_at: "2018-09-23T15:00:00.000Z",
        shipment_cost: {
          currency: "string",
          amount: 0,
        },
        insurance_cost: {
          currency: "string",
          amount: 0,
        },
        tracking_number: "782758401696",
        is_return_label: true,
        rma_number: "string",
        is_international: true,
        batch_id: "se-28529731",
        carrier_id: "se-28529731",
        charge_event: "carrier_default",
        service_code: "usps_first_class_mail",
        package_code: "small_flat_rate_box",
        voided: true,
        voided_at: "2018-09-23T15:00:00.000Z",
        label_format: "pdf",
        display_scheme: "label",
        label_layout: "4x6",
        trackable: true,
        label_image_id: "img_DtBXupDBxREpHnwEXhTfgK",
        carrier_code: "dhl_express",
        tracking_status: "unknown",
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
        insurance_claim: {
          href: "https://api.shipengine.com/v1/labels/se-28529731",
          type: "string",
        },
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
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.labels.label_by_external_shipment_id}/#{shipment_id}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = labels.label_by_external_shipment_id(shipment_id: shipment_id, params: params)

      assert_requested(request, times: 1)

      expect(response.label_id).to(eq(expected_response[:label_id]))
      expect(response.status).to(eq(expected_response[:status]))
      expect(response.shipment_id).to(eq(expected_response[:shipment_id]))
      expect(response.ship_date).to(eq(expected_response[:ship_date]))
      expect(response.created_at).to(eq(expected_response[:created_at]))
      expect(response.tracking_number).to(eq(expected_response[:tracking_number]))
      expect(response.is_return_label).to(eq(expected_response[:is_return_label]))
      expect(response.rma_number).to(eq(expected_response[:rma_number]))
      expect(response.is_international).to(eq(expected_response[:is_international]))
      expect(response.batch_id).to(eq(expected_response[:batch_id]))
      expect(response.carrier_id).to(eq(expected_response[:carrier_id]))
      expect(response.charge_event).to(eq(expected_response[:charge_event]))
      expect(response.service_code).to(eq(expected_response[:service_code]))
      expect(response.package_code).to(eq(expected_response[:package_code]))
      expect(response.voided).to(eq(expected_response[:voided]))
      expect(response.voided_at).to(eq(expected_response[:voided_at]))
      expect(response.label_format).to(eq(expected_response[:label_format]))
      expect(response.display_scheme).to(eq(expected_response[:display_scheme]))
      expect(response.label_layout).to(eq(expected_response[:label_layout]))
      expect(response.trackable).to(eq(expected_response[:trackable]))
      expect(response.label_image_id).to(eq(expected_response[:label_image_id]))
      expect(response.carrier_code).to(eq(expected_response[:carrier_code]))
      expect(response.tracking_status).to(eq(expected_response[:tracking_status]))

      expect(response.shipment_cost.currency).to(eq(expected_response[:shipment_cost][:currency]))
      expect(response.shipment_cost.amount).to(eq(expected_response[:shipment_cost][:amount]))

      expect(response.insurance_cost.currency).to(eq(expected_response[:insurance_cost][:currency]))
      expect(response.insurance_cost.amount).to(eq(expected_response[:insurance_cost][:amount]))

      expect(response.label_download.href).to(eq(expected_response[:label_download][:href]))
      expect(response.label_download.pdf).to(eq(expected_response[:label_download][:pdf]))

      expect(response.form_download.href).to(eq(expected_response[:form_download][:href]))

      expect(response.insurance_claim.href).to(eq(expected_response[:insurance_claim][:href]))

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

      expect(response.packages[0].tracking_number).to(eq(expected_response[:packages][0][:tracking_number]))

      expect(response.packages[0].label_messages.reference1).to(eq(expected_response[:packages][0][:label_messages][:reference1]))
      expect(response.packages[0].label_messages.reference2).to(eq(expected_response[:packages][0][:label_messages][:reference2]))
      expect(response.packages[0].label_messages.reference3).to(eq(expected_response[:packages][0][:label_messages][:reference3]))

      expect(response.packages[0].external_package_id).to(eq(expected_response[:packages][0][:external_package_id]))

      expect(response.packages[0].label_download.href).to(eq(expected_response[:packages][0][:label_download][:href]))
      expect(response.packages[0].label_download.pdf).to(eq(expected_response[:packages][0][:label_download][:pdf]))

      expect(response.packages[0].form_download.href).to(eq(expected_response[:packages][0][:form_download][:href]))

      expect(response.packages[0].sequence).to(eq(expected_response[:packages][0][:sequence]))
    end
  end

  context "Purchase Label with Rate ID" do
    it "should purchase label with rate id" do
      rate_id = "se-28529731"
      params = {}
      expected_response = {
        label_id: "se-28529731",
        status: "processing",
        shipment_id: "se-28529731",
        ship_date: "2018-09-23T00:00:00.000Z",
        created_at: "2018-09-23T15:00:00.000Z",
        shipment_cost: {
          currency: "string",
          amount: 0,
        },
        insurance_cost: {
          currency: "string",
          amount: 0,
        },
        tracking_number: "782758401696",
        is_return_label: true,
        rma_number: "string",
        is_international: true,
        batch_id: "se-28529731",
        carrier_id: "se-28529731",
        charge_event: "carrier_default",
        service_code: "usps_first_class_mail",
        package_code: "small_flat_rate_box",
        voided: true,
        voided_at: "2018-09-23T15:00:00.000Z",
        label_format: "pdf",
        display_scheme: "label",
        label_layout: "4x6",
        trackable: true,
        label_image_id: "img_DtBXupDBxREpHnwEXhTfgK",
        carrier_code: "dhl_express",
        tracking_status: "unknown",
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
        insurance_claim: {
          href: "https://api.shipengine.com/v1/labels/se-28529731",
          type: "string",
        },
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
      }

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.labels.purchase_label_with_rate_id}/#{rate_id}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = labels.purchase_label_with_rate_id(rate_id: rate_id, params: params)

      assert_requested(request, times: 1)

      expect(response.label_id).to(eq(expected_response[:label_id]))
      expect(response.status).to(eq(expected_response[:status]))
      expect(response.shipment_id).to(eq(expected_response[:shipment_id]))
      expect(response.ship_date).to(eq(expected_response[:ship_date]))
      expect(response.created_at).to(eq(expected_response[:created_at]))
      expect(response.tracking_number).to(eq(expected_response[:tracking_number]))
      expect(response.is_return_label).to(eq(expected_response[:is_return_label]))
      expect(response.rma_number).to(eq(expected_response[:rma_number]))
      expect(response.is_international).to(eq(expected_response[:is_international]))
      expect(response.batch_id).to(eq(expected_response[:batch_id]))
      expect(response.carrier_id).to(eq(expected_response[:carrier_id]))
      expect(response.charge_event).to(eq(expected_response[:charge_event]))
      expect(response.service_code).to(eq(expected_response[:service_code]))
      expect(response.package_code).to(eq(expected_response[:package_code]))
      expect(response.voided).to(eq(expected_response[:voided]))
      expect(response.voided_at).to(eq(expected_response[:voided_at]))
      expect(response.label_format).to(eq(expected_response[:label_format]))
      expect(response.display_scheme).to(eq(expected_response[:display_scheme]))
      expect(response.label_layout).to(eq(expected_response[:label_layout]))
      expect(response.trackable).to(eq(expected_response[:trackable]))
      expect(response.label_image_id).to(eq(expected_response[:label_image_id]))
      expect(response.carrier_code).to(eq(expected_response[:carrier_code]))
      expect(response.tracking_status).to(eq(expected_response[:tracking_status]))

      expect(response.shipment_cost.currency).to(eq(expected_response[:shipment_cost][:currency]))
      expect(response.shipment_cost.amount).to(eq(expected_response[:shipment_cost][:amount]))

      expect(response.insurance_cost.currency).to(eq(expected_response[:insurance_cost][:currency]))
      expect(response.insurance_cost.amount).to(eq(expected_response[:insurance_cost][:amount]))

      expect(response.label_download.href).to(eq(expected_response[:label_download][:href]))
      expect(response.label_download.pdf).to(eq(expected_response[:label_download][:pdf]))

      expect(response.form_download.href).to(eq(expected_response[:form_download][:href]))

      expect(response.insurance_claim.href).to(eq(expected_response[:insurance_claim][:href]))

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

      expect(response.packages[0].tracking_number).to(eq(expected_response[:packages][0][:tracking_number]))

      expect(response.packages[0].label_messages.reference1).to(eq(expected_response[:packages][0][:label_messages][:reference1]))
      expect(response.packages[0].label_messages.reference2).to(eq(expected_response[:packages][0][:label_messages][:reference2]))
      expect(response.packages[0].label_messages.reference3).to(eq(expected_response[:packages][0][:label_messages][:reference3]))

      expect(response.packages[0].external_package_id).to(eq(expected_response[:packages][0][:external_package_id]))

      expect(response.packages[0].label_download.href).to(eq(expected_response[:packages][0][:label_download][:href]))
      expect(response.packages[0].label_download.pdf).to(eq(expected_response[:packages][0][:label_download][:pdf]))

      expect(response.packages[0].form_download.href).to(eq(expected_response[:packages][0][:form_download][:href]))

      expect(response.packages[0].sequence).to(eq(expected_response[:packages][0][:sequence]))
    end
  end

  context "Purchase Label with Shipment ID" do
    it "should purchase label with rate id" do
      shipment_id = "se-28529731"
      params = {}
      expected_response = {
        label_id: "se-28529731",
        status: "processing",
        shipment_id: "se-28529731",
        ship_date: "2018-09-23T00:00:00.000Z",
        created_at: "2018-09-23T15:00:00.000Z",
        shipment_cost: {
          currency: "string",
          amount: 0,
        },
        insurance_cost: {
          currency: "string",
          amount: 0,
        },
        tracking_number: "782758401696",
        is_return_label: true,
        rma_number: "string",
        is_international: true,
        batch_id: "se-28529731",
        carrier_id: "se-28529731",
        charge_event: "carrier_default",
        service_code: "usps_first_class_mail",
        package_code: "small_flat_rate_box",
        voided: true,
        voided_at: "2018-09-23T15:00:00.000Z",
        label_format: "pdf",
        display_scheme: "label",
        label_layout: "4x6",
        trackable: true,
        label_image_id: "img_DtBXupDBxREpHnwEXhTfgK",
        carrier_code: "dhl_express",
        tracking_status: "unknown",
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
        insurance_claim: {
          href: "https://api.shipengine.com/v1/labels/se-28529731",
          type: "string",
        },
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
      }

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.labels.purchase_label_with_shipment_id}/#{shipment_id}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = labels.purchase_label_with_shipment_id(shipment_id: shipment_id, params: params)

      assert_requested(request, times: 1)

      expect(response.label_id).to(eq(expected_response[:label_id]))
      expect(response.status).to(eq(expected_response[:status]))
      expect(response.shipment_id).to(eq(expected_response[:shipment_id]))
      expect(response.ship_date).to(eq(expected_response[:ship_date]))
      expect(response.created_at).to(eq(expected_response[:created_at]))
      expect(response.tracking_number).to(eq(expected_response[:tracking_number]))
      expect(response.is_return_label).to(eq(expected_response[:is_return_label]))
      expect(response.rma_number).to(eq(expected_response[:rma_number]))
      expect(response.is_international).to(eq(expected_response[:is_international]))
      expect(response.batch_id).to(eq(expected_response[:batch_id]))
      expect(response.carrier_id).to(eq(expected_response[:carrier_id]))
      expect(response.charge_event).to(eq(expected_response[:charge_event]))
      expect(response.service_code).to(eq(expected_response[:service_code]))
      expect(response.package_code).to(eq(expected_response[:package_code]))
      expect(response.voided).to(eq(expected_response[:voided]))
      expect(response.voided_at).to(eq(expected_response[:voided_at]))
      expect(response.label_format).to(eq(expected_response[:label_format]))
      expect(response.display_scheme).to(eq(expected_response[:display_scheme]))
      expect(response.label_layout).to(eq(expected_response[:label_layout]))
      expect(response.trackable).to(eq(expected_response[:trackable]))
      expect(response.label_image_id).to(eq(expected_response[:label_image_id]))
      expect(response.carrier_code).to(eq(expected_response[:carrier_code]))
      expect(response.tracking_status).to(eq(expected_response[:tracking_status]))

      expect(response.shipment_cost.currency).to(eq(expected_response[:shipment_cost][:currency]))
      expect(response.shipment_cost.amount).to(eq(expected_response[:shipment_cost][:amount]))

      expect(response.insurance_cost.currency).to(eq(expected_response[:insurance_cost][:currency]))
      expect(response.insurance_cost.amount).to(eq(expected_response[:insurance_cost][:amount]))

      expect(response.label_download.href).to(eq(expected_response[:label_download][:href]))
      expect(response.label_download.pdf).to(eq(expected_response[:label_download][:pdf]))

      expect(response.form_download.href).to(eq(expected_response[:form_download][:href]))

      expect(response.insurance_claim.href).to(eq(expected_response[:insurance_claim][:href]))

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

      expect(response.packages[0].tracking_number).to(eq(expected_response[:packages][0][:tracking_number]))

      expect(response.packages[0].label_messages.reference1).to(eq(expected_response[:packages][0][:label_messages][:reference1]))
      expect(response.packages[0].label_messages.reference2).to(eq(expected_response[:packages][0][:label_messages][:reference2]))
      expect(response.packages[0].label_messages.reference3).to(eq(expected_response[:packages][0][:label_messages][:reference3]))

      expect(response.packages[0].external_package_id).to(eq(expected_response[:packages][0][:external_package_id]))

      expect(response.packages[0].label_download.href).to(eq(expected_response[:packages][0][:label_download][:href]))
      expect(response.packages[0].label_download.pdf).to(eq(expected_response[:packages][0][:label_download][:pdf]))

      expect(response.packages[0].form_download.href).to(eq(expected_response[:packages][0][:form_download][:href]))

      expect(response.packages[0].sequence).to(eq(expected_response[:packages][0][:sequence]))
    end
  end

  context "Get Label By ID" do
    it "should purchase label with rate id" do
      label_id = "se-28529731"
      params = {}
      expected_response = {
        label_id: "se-28529731",
        status: "processing",
        shipment_id: "se-28529731",
        ship_date: "2018-09-23T00:00:00.000Z",
        created_at: "2018-09-23T15:00:00.000Z",
        shipment_cost: {
          currency: "string",
          amount: 0,
        },
        insurance_cost: {
          currency: "string",
          amount: 0,
        },
        tracking_number: "782758401696",
        is_return_label: true,
        rma_number: "string",
        is_international: true,
        batch_id: "se-28529731",
        carrier_id: "se-28529731",
        charge_event: "carrier_default",
        service_code: "usps_first_class_mail",
        package_code: "small_flat_rate_box",
        voided: true,
        voided_at: "2018-09-23T15:00:00.000Z",
        label_format: "pdf",
        display_scheme: "label",
        label_layout: "4x6",
        trackable: true,
        label_image_id: "img_DtBXupDBxREpHnwEXhTfgK",
        carrier_code: "dhl_express",
        tracking_status: "unknown",
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
        insurance_claim: {
          href: "https://api.shipengine.com/v1/labels/se-28529731",
          type: "string",
        },
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
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.labels.root}/#{label_id}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = labels.label_by_id(label_id: label_id, params: params)

      assert_requested(request, times: 1)

      expect(response.label_id).to(eq(expected_response[:label_id]))
      expect(response.status).to(eq(expected_response[:status]))
      expect(response.shipment_id).to(eq(expected_response[:shipment_id]))
      expect(response.ship_date).to(eq(expected_response[:ship_date]))
      expect(response.created_at).to(eq(expected_response[:created_at]))
      expect(response.tracking_number).to(eq(expected_response[:tracking_number]))
      expect(response.is_return_label).to(eq(expected_response[:is_return_label]))
      expect(response.rma_number).to(eq(expected_response[:rma_number]))
      expect(response.is_international).to(eq(expected_response[:is_international]))
      expect(response.batch_id).to(eq(expected_response[:batch_id]))
      expect(response.carrier_id).to(eq(expected_response[:carrier_id]))
      expect(response.charge_event).to(eq(expected_response[:charge_event]))
      expect(response.service_code).to(eq(expected_response[:service_code]))
      expect(response.package_code).to(eq(expected_response[:package_code]))
      expect(response.voided).to(eq(expected_response[:voided]))
      expect(response.voided_at).to(eq(expected_response[:voided_at]))
      expect(response.label_format).to(eq(expected_response[:label_format]))
      expect(response.display_scheme).to(eq(expected_response[:display_scheme]))
      expect(response.label_layout).to(eq(expected_response[:label_layout]))
      expect(response.trackable).to(eq(expected_response[:trackable]))
      expect(response.label_image_id).to(eq(expected_response[:label_image_id]))
      expect(response.carrier_code).to(eq(expected_response[:carrier_code]))
      expect(response.tracking_status).to(eq(expected_response[:tracking_status]))

      expect(response.shipment_cost.currency).to(eq(expected_response[:shipment_cost][:currency]))
      expect(response.shipment_cost.amount).to(eq(expected_response[:shipment_cost][:amount]))

      expect(response.insurance_cost.currency).to(eq(expected_response[:insurance_cost][:currency]))
      expect(response.insurance_cost.amount).to(eq(expected_response[:insurance_cost][:amount]))

      expect(response.label_download.href).to(eq(expected_response[:label_download][:href]))
      expect(response.label_download.pdf).to(eq(expected_response[:label_download][:pdf]))

      expect(response.form_download.href).to(eq(expected_response[:form_download][:href]))

      expect(response.insurance_claim.href).to(eq(expected_response[:insurance_claim][:href]))

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

      expect(response.packages[0].tracking_number).to(eq(expected_response[:packages][0][:tracking_number]))

      expect(response.packages[0].label_messages.reference1).to(eq(expected_response[:packages][0][:label_messages][:reference1]))
      expect(response.packages[0].label_messages.reference2).to(eq(expected_response[:packages][0][:label_messages][:reference2]))
      expect(response.packages[0].label_messages.reference3).to(eq(expected_response[:packages][0][:label_messages][:reference3]))

      expect(response.packages[0].external_package_id).to(eq(expected_response[:packages][0][:external_package_id]))

      expect(response.packages[0].label_download.href).to(eq(expected_response[:packages][0][:label_download][:href]))
      expect(response.packages[0].label_download.pdf).to(eq(expected_response[:packages][0][:label_download][:pdf]))

      expect(response.packages[0].form_download.href).to(eq(expected_response[:packages][0][:form_download][:href]))

      expect(response.packages[0].sequence).to(eq(expected_response[:packages][0][:sequence]))
    end
  end

  context "Create a return label" do
    it "should create a return label" do
      label_id = "se-28529731"
      params = {}
      expected_response = {
        label_id: "se-28529731",
        status: "processing",
        shipment_id: "se-28529731",
        ship_date: "2018-09-23T00:00:00.000Z",
        created_at: "2018-09-23T15:00:00.000Z",
        shipment_cost: {
          currency: "string",
          amount: 0,
        },
        insurance_cost: {
          currency: "string",
          amount: 0,
        },
        tracking_number: "782758401696",
        is_return_label: true,
        rma_number: "string",
        is_international: true,
        batch_id: "se-28529731",
        carrier_id: "se-28529731",
        charge_event: "carrier_default",
        service_code: "usps_first_class_mail",
        package_code: "small_flat_rate_box",
        voided: true,
        voided_at: "2018-09-23T15:00:00.000Z",
        label_format: "pdf",
        display_scheme: "label",
        label_layout: "4x6",
        trackable: true,
        label_image_id: "img_DtBXupDBxREpHnwEXhTfgK",
        carrier_code: "dhl_express",
        tracking_status: "unknown",
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
        insurance_claim: {
          href: "https://api.shipengine.com/v1/labels/se-28529731",
          type: "string",
        },
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
      }

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.labels.root}/#{label_id}/return"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = labels.create_return_label(label_id: label_id, params: params)

      assert_requested(request, times: 1)

      expect(response.label_id).to(eq(expected_response[:label_id]))
      expect(response.status).to(eq(expected_response[:status]))
      expect(response.shipment_id).to(eq(expected_response[:shipment_id]))
      expect(response.ship_date).to(eq(expected_response[:ship_date]))
      expect(response.created_at).to(eq(expected_response[:created_at]))
      expect(response.tracking_number).to(eq(expected_response[:tracking_number]))
      expect(response.is_return_label).to(eq(expected_response[:is_return_label]))
      expect(response.rma_number).to(eq(expected_response[:rma_number]))
      expect(response.is_international).to(eq(expected_response[:is_international]))
      expect(response.batch_id).to(eq(expected_response[:batch_id]))
      expect(response.carrier_id).to(eq(expected_response[:carrier_id]))
      expect(response.charge_event).to(eq(expected_response[:charge_event]))
      expect(response.service_code).to(eq(expected_response[:service_code]))
      expect(response.package_code).to(eq(expected_response[:package_code]))
      expect(response.voided).to(eq(expected_response[:voided]))
      expect(response.voided_at).to(eq(expected_response[:voided_at]))
      expect(response.label_format).to(eq(expected_response[:label_format]))
      expect(response.display_scheme).to(eq(expected_response[:display_scheme]))
      expect(response.label_layout).to(eq(expected_response[:label_layout]))
      expect(response.trackable).to(eq(expected_response[:trackable]))
      expect(response.label_image_id).to(eq(expected_response[:label_image_id]))
      expect(response.carrier_code).to(eq(expected_response[:carrier_code]))
      expect(response.tracking_status).to(eq(expected_response[:tracking_status]))

      expect(response.shipment_cost.currency).to(eq(expected_response[:shipment_cost][:currency]))
      expect(response.shipment_cost.amount).to(eq(expected_response[:shipment_cost][:amount]))

      expect(response.insurance_cost.currency).to(eq(expected_response[:insurance_cost][:currency]))
      expect(response.insurance_cost.amount).to(eq(expected_response[:insurance_cost][:amount]))

      expect(response.label_download.href).to(eq(expected_response[:label_download][:href]))
      expect(response.label_download.pdf).to(eq(expected_response[:label_download][:pdf]))

      expect(response.form_download.href).to(eq(expected_response[:form_download][:href]))

      expect(response.insurance_claim.href).to(eq(expected_response[:insurance_claim][:href]))

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

      expect(response.packages[0].tracking_number).to(eq(expected_response[:packages][0][:tracking_number]))

      expect(response.packages[0].label_messages.reference1).to(eq(expected_response[:packages][0][:label_messages][:reference1]))
      expect(response.packages[0].label_messages.reference2).to(eq(expected_response[:packages][0][:label_messages][:reference2]))
      expect(response.packages[0].label_messages.reference3).to(eq(expected_response[:packages][0][:label_messages][:reference3]))

      expect(response.packages[0].external_package_id).to(eq(expected_response[:packages][0][:external_package_id]))

      expect(response.packages[0].label_download.href).to(eq(expected_response[:packages][0][:label_download][:href]))
      expect(response.packages[0].label_download.pdf).to(eq(expected_response[:packages][0][:label_download][:pdf]))

      expect(response.packages[0].form_download.href).to(eq(expected_response[:packages][0][:form_download][:href]))

      expect(response.packages[0].sequence).to(eq(expected_response[:packages][0][:sequence]))
    end
  end

  context "Get Label Tracking Information" do
    it "should get label tracking information" do
      label_id = "se-28529731"
      params = {}
      expected_response = {
        tracking_number: "1Z932R800392060079",
        tracking_url: "https://www.fedex.com/fedextrack/?action=track&trackingnumber=1234",
        status_code: "un",
        carrier_code: "dhl_express",
        carrier_id: "se-28529731",
        status_description: "Delivered",
        carrier_status_code: 1,
        carrier_detail_code: "OT",
        carrier_status_description: "Your item was delivered in or at the mailbox at 9:10 am on March",
        ship_date: "2018-09-23T15:00:00.000Z",
        estimated_delivery_date: "2018-09-23T15:00:00.000Z",
        actual_delivery_date: "2018-09-23T15:00:00.000Z",
        exception_description: "string",
        events: [
          {
            occurred_at: "2018-09-23T15:00:00.000Z",
            carrier_occurred_at: "2018-09-23T15:00:00.000Z",
            description: "Delivered, In/At Mailbox",
            city_locality: "AUSTIN",
            state_province: "TX",
            postal_code: 78756,
            country_code: "CA",
            company_name: "Stamps.com",
            signer: "string",
            event_code: "string",
            carrier_detail_code: "OT",
            status_code: "un",
            status_description: "In Transit",
            carrier_status_code: 1,
            carrier_status_description: "Your item was delivered in or at the mailbox at 9:10 am on March",
            latitude: -90,
            longitude: -180,
          },
        ],
      }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.labels.root}/#{label_id}/track"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = labels.label_tracking_information(label_id: label_id, params: params)

      assert_requested(request, times: 1)

      expect(response.tracking_number).to(eq(expected_response[:tracking_number]))
      expect(response.tracking_url).to(eq(expected_response[:tracking_url]))
      expect(response.status_code).to(eq(expected_response[:status_code]))
      expect(response.carrier_code).to(eq(expected_response[:carrier_code]))
      expect(response.carrier_id).to(eq(expected_response[:carrier_id]))
      expect(response.status_description).to(eq(expected_response[:status_description]))
      expect(response.carrier_status_code).to(eq(expected_response[:carrier_status_code]))
      expect(response.carrier_detail_code).to(eq(expected_response[:carrier_detail_code]))
      expect(response.carrier_status_description).to(eq(expected_response[:carrier_status_description]))
      expect(response.ship_date).to(eq(expected_response[:ship_date]))
      expect(response.estimated_delivery_date).to(eq(expected_response[:estimated_delivery_date]))
      expect(response.actual_delivery_date).to(eq(expected_response[:actual_delivery_date]))
      expect(response.exception_description).to(eq(expected_response[:exception_description]))
      expect(response.events[0].occurred_at).to(eq(expected_response[:events][0][:occurred_at]))
      expect(response.events[0].carrier_occurred_at).to(eq(expected_response[:events][0][:carrier_occurred_at]))
      expect(response.events[0].description).to(eq(expected_response[:events][0][:description]))
      expect(response.events[0].city_locality).to(eq(expected_response[:events][0][:city_locality]))
      expect(response.events[0].state_province).to(eq(expected_response[:events][0][:state_province]))
      expect(response.events[0].postal_code).to(eq(expected_response[:events][0][:postal_code]))
      expect(response.events[0].country_code).to(eq(expected_response[:events][0][:country_code]))
      expect(response.events[0].company_name).to(eq(expected_response[:events][0][:company_name]))
      expect(response.events[0].signer).to(eq(expected_response[:events][0][:signer]))
      expect(response.events[0].event_code).to(eq(expected_response[:events][0][:event_code]))
      expect(response.events[0].carrier_detail_code).to(eq(expected_response[:events][0][:carrier_detail_code]))
      expect(response.events[0].status_code).to(eq(expected_response[:events][0][:status_code]))
      expect(response.events[0].status_description).to(eq(expected_response[:events][0][:status_description]))
      expect(response.events[0].carrier_status_code).to(eq(expected_response[:events][0][:carrier_status_code]))
      expect(response.events[0].carrier_status_description).to(eq(expected_response[:events][0][:carrier_status_description]))
      expect(response.events[0].latitude).to(eq(expected_response[:events][0][:latitude]))
      expect(response.events[0].longitude).to(eq(expected_response[:events][0][:longitude]))
    end
  end

  context "Void a Label By ID" do
    it "should create a return label" do
      label_id = "se-28529731"
      params = {}
      expected_response = {
        approved: true,
        message: "Request for refund submitted.  This label has been voided."
      }

      request = stub_request(
        :put,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.labels.root}/#{label_id}/void"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = labels.void_label_by_id(label_id: label_id, params: params)

      assert_requested(request, times: 1)

      expect(response.approved).to(eq(expected_response[:approved]))
      expect(response.message).to(eq(expected_response[:message]))
    end
  end
end
