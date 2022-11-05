# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::Addresses) do
  let(:addresses) { ShipEngine::Domain::Addresses.new }

  before(:all) do
    WebMock.enable_net_connect!
  end

  after(:all) do
    WebMock.disable_net_connect!
  end

  context "Parse an address" do
    it "should parse address from text" do
      params = {
        text: "I need to send a package to my friend Amanda Millers house at 525 Winchester Blvd in San Jose (thats california, obviously). The zip code there is 95128.",
      }

      expected_response = {
        score: 0.9710697187242877,
        address: {
          name: "Amanda Millers",
          address_line1: "525 Winchester Blvd",
          city_locality: "San Jose",
          state_province: "CA",
          postal_code: "95128",
          address_residential_indicator: ShipEngine::Enums::AddressResidentialIndicatorTypes::YES,
        },
        entities: [
          {
            type: "person",
            score: 0.9519646137063122,
            text: "Amanda Millers",
            start_index: 38,
            end_index: 51,
            result: {
              value: "Amanda Millers",
            },
          },
          {
            type: "residential_indicator",
            score: 0.9519646137063122,
            text: "house",
            start_index: 53,
            end_index: 57,
            result: {
              value: "yes",
            },
          },
          {
            type: "address_line",
            score: 0.9805313966503588,
            text: "525 Winchester Blvd",
            start_index: 62,
            end_index: 80,
            result: {
              line: 1,
              value: "525 Winchester Blvd",
            },
          },
          {
            type: "number",
            score: 0.9805313966503588,
            text: "525",
            start_index: 62,
            end_index: 64,
            result: {
              type: "cardinal",
              value: 525,
            },
          },
          {
            type: "city_locality",
            score: 0.9805313966503588,
            text: "San Jose",
            start_index: 85,
            end_index: 92,
            result: {
              value: "San Jose",
            },
          },
          {
            type: "state_province",
            score: 0.9805313966503588,
            text: "california",
            start_index: 101,
            end_index: 110,
            result: {
              name: "California",
              value: "CA",
            },
          },
          {
            type: "postal_code",
            score: 0.9519646137063122,
            text: "95128",
            start_index: 147,
            end_index: 151,
            result: {
              value: "95128",
            },
          },
        ],
      }

      response = addresses.parse_address(params)

      expect(response.score).to(eq(expected_response[:score]))

      expect(response.address.name).to(eq(expected_response[:address][:name]))
      expect(response.address.address_line1).to(eq(expected_response[:address][:address_line1]))
      expect(response.address.city_locality).to(eq(expected_response[:address][:city_locality]))
      expect(response.address.state_province).to(eq(expected_response[:address][:state_province]))
      expect(response.address.postal_code).to(eq(expected_response[:address][:postal_code]))
      expect(response.address.address_residential_indicator).to(eq(expected_response[:address][:address_residential_indicator]))

      expect(response.entities[0].type).to(eq(expected_response[:entities][0][:type]))
      expect(response.entities[0].score).to(eq(expected_response[:entities][0][:score]))
      expect(response.entities[0].text).to(eq(expected_response[:entities][0][:text]))
      expect(response.entities[0].start_index).to(eq(expected_response[:entities][0][:start_index]))
      expect(response.entities[0].end_index).to(eq(expected_response[:entities][0][:end_index]))
      expect(response.entities[0].result.value).to(eq(expected_response[:entities][0][:result][:value]))

      expect(response.entities[1].type).to(eq(expected_response[:entities][1][:type]))
      expect(response.entities[1].score).to(eq(expected_response[:entities][1][:score]))
      expect(response.entities[1].text).to(eq(expected_response[:entities][1][:text]))
      expect(response.entities[1].start_index).to(eq(expected_response[:entities][1][:start_index]))
      expect(response.entities[1].end_index).to(eq(expected_response[:entities][1][:end_index]))
      expect(response.entities[1].result.value).to(eq(expected_response[:entities][1][:result][:value]))

      expect(response.entities[2].type).to(eq(expected_response[:entities][2][:type]))
      expect(response.entities[2].score).to(eq(expected_response[:entities][2][:score]))
      expect(response.entities[2].text).to(eq(expected_response[:entities][2][:text]))
      expect(response.entities[2].start_index).to(eq(expected_response[:entities][2][:start_index]))
      expect(response.entities[2].end_index).to(eq(expected_response[:entities][2][:end_index]))
      expect(response.entities[2].result.value).to(eq(expected_response[:entities][2][:result][:value]))

      expect(response.entities[3].type).to(eq(expected_response[:entities][3][:type]))
      expect(response.entities[3].score).to(eq(expected_response[:entities][3][:score]))
      expect(response.entities[3].text).to(eq(expected_response[:entities][3][:text]))
      expect(response.entities[3].start_index).to(eq(expected_response[:entities][3][:start_index]))
      expect(response.entities[3].end_index).to(eq(expected_response[:entities][3][:end_index]))
      expect(response.entities[3].result.value).to(eq(expected_response[:entities][3][:result][:value]))

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
      expect(response.entities[5].result.value).to(eq(expected_response[:entities][5][:result][:value]))

      expect(response.entities[6].type).to(eq(expected_response[:entities][6][:type]))
      expect(response.entities[6].score).to(eq(expected_response[:entities][6][:score]))
      expect(response.entities[6].text).to(eq(expected_response[:entities][6][:text]))
      expect(response.entities[6].start_index).to(eq(expected_response[:entities][6][:start_index]))
      expect(response.entities[6].end_index).to(eq(expected_response[:entities][6][:end_index]))
      expect(response.entities[6].result.value).to(eq(expected_response[:entities][6][:result][:value]))
    end

    it "should parse address from text with already-known fields" do
      params = {
        text: "I need to send a package to my friend Amanda Millers house at 525 Winchester Blvd in San Jose (thats california, obviously). The zip code there is 95128.",
        address: {
          name: "Dr. Amanda L Millers",
          country_code: "US",
        },
      }

      expected_response = {
        score: 0.9710697187242877,
        address: {
          name: "Dr. Amanda L Millers",
          address_line1: "525 Winchester Blvd",
          city_locality: "San Jose",
          state_province: "CA",
          postal_code: "95128",
          country_code: "US",
          address_residential_indicator: ShipEngine::Enums::AddressResidentialIndicatorTypes::YES,
        },
        entities: [
          {
            type: "person",
            score: 0.9519646137063122,
            text: "Amanda Millers",
            start_index: 38,
            end_index: 51,
            result: {
              value: "Amanda Millers",
            },
          },
          {
            type: "residential_indicator",
            score: 0.9519646137063122,
            text: "house",
            start_index: 53,
            end_index: 57,
            result: {
              value: "yes",
            },
          },
          {
            type: "address_line",
            score: 0.9805313966503588,
            text: "525 Winchester Blvd",
            start_index: 62,
            end_index: 80,
            result: {
              line: 1,
              value: "525 Winchester Blvd",
            },
          },
          {
            type: "number",
            score: 0.9805313966503588,
            text: "525",
            start_index: 62,
            end_index: 64,
            result: {
              type: "cardinal",
              value: 525,
            },
          },
          {
            type: "city_locality",
            score: 0.9805313966503588,
            text: "San Jose",
            start_index: 85,
            end_index: 92,
            result: {
              value: "San Jose",
            },
          },
          {
            type: "state_province",
            score: 0.9805313966503588,
            text: "california",
            start_index: 101,
            end_index: 110,
            result: {
              name: "California",
              value: "CA",
            },
          },
          {
            type: "postal_code",
            score: 0.9519646137063122,
            text: "95128",
            start_index: 147,
            end_index: 151,
            result: {
              value: "95128",
            },
          },
        ],
      }

      response = addresses.parse_address(params)

      expect(response.score).to(eq(expected_response[:score]))

      expect(response.address.name).to(eq(expected_response[:address][:name]))
      expect(response.address.address_line1).to(eq(expected_response[:address][:address_line1]))
      expect(response.address.city_locality).to(eq(expected_response[:address][:city_locality]))
      expect(response.address.state_province).to(eq(expected_response[:address][:state_province]))
      expect(response.address.postal_code).to(eq(expected_response[:address][:postal_code]))
      expect(response.address.country_code).to(eq(expected_response[:address][:country_code]))
      expect(response.address.address_residential_indicator).to(eq(expected_response[:address][:address_residential_indicator]))

      expect(response.entities[0].type).to(eq(expected_response[:entities][0][:type]))
      expect(response.entities[0].score).to(eq(expected_response[:entities][0][:score]))
      expect(response.entities[0].text).to(eq(expected_response[:entities][0][:text]))
      expect(response.entities[0].start_index).to(eq(expected_response[:entities][0][:start_index]))
      expect(response.entities[0].end_index).to(eq(expected_response[:entities][0][:end_index]))
      expect(response.entities[0].result.value).to(eq(expected_response[:entities][0][:result][:value]))

      expect(response.entities[1].type).to(eq(expected_response[:entities][1][:type]))
      expect(response.entities[1].score).to(eq(expected_response[:entities][1][:score]))
      expect(response.entities[1].text).to(eq(expected_response[:entities][1][:text]))
      expect(response.entities[1].start_index).to(eq(expected_response[:entities][1][:start_index]))
      expect(response.entities[1].end_index).to(eq(expected_response[:entities][1][:end_index]))
      expect(response.entities[1].result.value).to(eq(expected_response[:entities][1][:result][:value]))

      expect(response.entities[2].type).to(eq(expected_response[:entities][2][:type]))
      expect(response.entities[2].score).to(eq(expected_response[:entities][2][:score]))
      expect(response.entities[2].text).to(eq(expected_response[:entities][2][:text]))
      expect(response.entities[2].start_index).to(eq(expected_response[:entities][2][:start_index]))
      expect(response.entities[2].end_index).to(eq(expected_response[:entities][2][:end_index]))
      expect(response.entities[2].result.value).to(eq(expected_response[:entities][2][:result][:value]))

      expect(response.entities[3].type).to(eq(expected_response[:entities][3][:type]))
      expect(response.entities[3].score).to(eq(expected_response[:entities][3][:score]))
      expect(response.entities[3].text).to(eq(expected_response[:entities][3][:text]))
      expect(response.entities[3].start_index).to(eq(expected_response[:entities][3][:start_index]))
      expect(response.entities[3].end_index).to(eq(expected_response[:entities][3][:end_index]))
      expect(response.entities[3].result.value).to(eq(expected_response[:entities][3][:result][:value]))

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
      expect(response.entities[5].result.value).to(eq(expected_response[:entities][5][:result][:value]))

      expect(response.entities[6].type).to(eq(expected_response[:entities][6][:type]))
      expect(response.entities[6].score).to(eq(expected_response[:entities][6][:score]))
      expect(response.entities[6].text).to(eq(expected_response[:entities][6][:text]))
      expect(response.entities[6].start_index).to(eq(expected_response[:entities][6][:start_index]))
      expect(response.entities[6].end_index).to(eq(expected_response[:entities][6][:end_index]))
      expect(response.entities[6].result.value).to(eq(expected_response[:entities][6][:result][:value]))
    end
  end

  context "Validate an addresses" do
    it "should validate address and return AddressStatus::VERIFIED status" do
      params = [{
        address_line1: "525 S Winchester Blvd",
        city_locality: "San Jose",
        state_province: "CA",
        postal_code: "95128",
        country_code: "US",
      }]

      expected_response = [{
        status: ShipEngine::Enums::AddressStatus::VERIFIED,
        original_address: {
          name: nil,
          phone: nil,
          company_name: nil,
          address_line1: "525 S Winchester Blvd",
          address_line2: nil,
          address_line3: nil,
          city_locality: "San Jose",
          state_province: "CA",
          postal_code: "95128",
          country_code: "US",
          address_residential_indicator: ShipEngine::Enums::AddressResidentialIndicatorTypes::UNKNOWN,
        },
        matched_address: {
          name: nil,
          phone: nil,
          company_name: nil,
          address_line1: "525 S WINCHESTER BLVD",
          address_line2: "",
          address_line3: nil,
          city_locality: "SAN JOSE",
          state_province: "CA",
          postal_code: "95128-2537",
          country_code: "US",
          address_residential_indicator: ShipEngine::Enums::AddressResidentialIndicatorTypes::NO,
        },
        messages: [],
      }]

      response = addresses.validate_address(params)

      expect(response[0].status).to(eq(expected_response[0][:status]))

      expect(response[0].original_address.name).to(eq(expected_response[0][:original_address][:name]))
      expect(response[0].original_address.phone).to(eq(expected_response[0][:original_address][:phone]))
      expect(response[0].original_address.company_name).to(eq(expected_response[0][:original_address][:company_name]))
      expect(response[0].original_address.address_line1).to(eq(expected_response[0][:original_address][:address_line1]))
      expect(response[0].original_address.address_line2).to(eq(expected_response[0][:original_address][:address_line2]))
      expect(response[0].original_address.address_line3).to(eq(expected_response[0][:original_address][:address_line3]))
      expect(response[0].original_address.city_locality).to(eq(expected_response[0][:original_address][:city_locality]))
      expect(response[0].original_address.state_province).to(eq(expected_response[0][:original_address][:state_province]))
      expect(response[0].original_address.postal_code).to(eq(expected_response[0][:original_address][:postal_code]))
      expect(response[0].original_address.country_code).to(eq(expected_response[0][:original_address][:country_code]))
      expect(response[0].original_address.address_residential_indicator).to(eq(expected_response[0][:original_address][:address_residential_indicator]))

      expect(response[0].matched_address.name).to(eq(expected_response[0][:matched_address][:name]))
      expect(response[0].matched_address.phone).to(eq(expected_response[0][:matched_address][:phone]))
      expect(response[0].matched_address.company_name).to(eq(expected_response[0][:matched_address][:company_name]))
      expect(response[0].matched_address.address_line1).to(eq(expected_response[0][:matched_address][:address_line1]))
      expect(response[0].matched_address.address_line2).to(eq(expected_response[0][:matched_address][:address_line2]))
      expect(response[0].matched_address.address_line3).to(eq(expected_response[0][:matched_address][:address_line3]))
      expect(response[0].matched_address.city_locality).to(eq(expected_response[0][:matched_address][:city_locality]))
      expect(response[0].matched_address.state_province).to(eq(expected_response[0][:matched_address][:state_province]))
      expect(response[0].matched_address.postal_code).to(eq(expected_response[0][:matched_address][:postal_code]))
      expect(response[0].matched_address.country_code).to(eq(expected_response[0][:matched_address][:country_code]))
      expect(response[0].matched_address.address_residential_indicator).to(eq(expected_response[0][:matched_address][:address_residential_indicator]))

      expect(response[0].messages.count).to(eq(expected_response[0][:messages].count))
    end

    it "should validate address and return AddressStatus::UNVERIFIED status" do
      params = [{
        address_line1: "525 S Winchester Blvd",
        city_locality: "San Jose",
        state_province: "CA",
        postal_code: "95128",
        country_code: "USA",
      }]

      expected_response = [{
        status: ShipEngine::Enums::AddressStatus::UNVERIFIED,
        original_address: {
          name: nil,
          phone: nil,
          company_name: nil,
          address_line1: "525 S Winchester Blvd",
          address_line2: nil,
          address_line3: nil,
          city_locality: "San Jose",
          state_province: "CA",
          postal_code: "95128",
          country_code: "USA",
          address_residential_indicator: ShipEngine::Enums::AddressResidentialIndicatorTypes::UNKNOWN,
        },
        matched_address: nil,
        messages: [
          {
            code: "a1005",
            message: "Length of property 'country_code' must equal exactly 2",
            type: ShipEngine::Enums::MessageStatus::ERROR,
            detail_code: "country_invalid_length",
          },
          {
            code: "a1001",
            message: "country_code is not currently a supported country, please check the documentation for acceptable 2-letter country codes.",
            type: ShipEngine::Enums::MessageStatus::ERROR,
            detail_code: "unsupported_country",
          },
        ],
      }]

      response = addresses.validate_address(params)

      expect(response[0].status).to(eq(expected_response[0][:status]))

      expect(response[0].original_address.name).to(eq(expected_response[0][:original_address][:name]))
      expect(response[0].original_address.phone).to(eq(expected_response[0][:original_address][:phone]))
      expect(response[0].original_address.company_name).to(eq(expected_response[0][:original_address][:company_name]))
      expect(response[0].original_address.address_line1).to(eq(expected_response[0][:original_address][:address_line1]))
      expect(response[0].original_address.address_line2).to(eq(expected_response[0][:original_address][:address_line2]))
      expect(response[0].original_address.address_line3).to(eq(expected_response[0][:original_address][:address_line3]))
      expect(response[0].original_address.city_locality).to(eq(expected_response[0][:original_address][:city_locality]))
      expect(response[0].original_address.state_province).to(eq(expected_response[0][:original_address][:state_province]))
      expect(response[0].original_address.postal_code).to(eq(expected_response[0][:original_address][:postal_code]))
      expect(response[0].original_address.country_code).to(eq(expected_response[0][:original_address][:country_code]))
      expect(response[0].original_address.address_residential_indicator).to(eq(expected_response[0][:original_address][:address_residential_indicator]))

      expect(response[0].matched_address).to(be_nil)

      expect(response[0].messages[0].code).to(eq(expected_response[0][:messages][0][:code]))
      expect(response[0].messages[0].message).to(eq(expected_response[0][:messages][0][:message]))
      expect(response[0].messages[0].type).to(eq(expected_response[0][:messages][0][:type]))
      expect(response[0].messages[0].detail_code).to(eq(expected_response[0][:messages][0][:detail_code]))

      expect(response[0].messages[1].code).to(eq(expected_response[0][:messages][1][:code]))
      expect(response[0].messages[1].message).to(eq(expected_response[0][:messages][1][:message]))
      expect(response[0].messages[1].type).to(eq(expected_response[0][:messages][1][:type]))
      expect(response[0].messages[1].detail_code).to(eq(expected_response[0][:messages][1][:detail_code]))
    end

    it "should validate address and return AddressStatus::WARNING status" do
      params = [{
        address_line1: "Studio Tour Drive, Leavesden WD25 7LR, UK",
        country_code: "GB",
      }]

      expected_response = [{
        status: ShipEngine::Enums::AddressStatus::VERIFIED,
        original_address: {
          name: nil,
          phone: nil,
          company_name: nil,
          address_line1: "Studio Tour Drive, Leavesden WD25 7LR, UK",
          address_line2: nil,
          address_line3: nil,
          city_locality: nil,
          state_province: nil,
          postal_code: nil,
          country_code: "GB",
          address_residential_indicator: ShipEngine::Enums::AddressResidentialIndicatorTypes::UNKNOWN,
        },
        matched_address: {
          name: nil,
          phone: nil,
          company_name: "WARNER BROS STUDIO TOUR",
          address_line1: "Studio Tour Drive",
          address_line2: "",
          address_line3: "",
          city_locality: "Watford",
          state_province: "Hertfordshire",
          postal_code: "WD25 7LR",
          country_code: "GB",
          address_residential_indicator: ShipEngine::Enums::AddressResidentialIndicatorTypes::UNKNOWN,
        },
        messages: [
          {
            code: "a1003",
            message: "There was a change or addition to the state/province.",
            type: ShipEngine::Enums::MessageStatus::WARNING,
            detail_code: "state_province_changed_or_added",
          },
          {
            code: "a1007",
            message: "This address has been verified down to the suite/PO box level (highest possible accuracy with the provided data)",
            type: ShipEngine::Enums::MessageStatus::INFO,
            detail_code: "verified_to_suite_level",
          },
          {
            code: "a1008",
            message: "This record was successfully geocoded down to the rooftop level, meaning this point is within the property limits (most likely in the center).",
            type: ShipEngine::Enums::MessageStatus::INFO,
            detail_code: "coded_to_rooftop_level",
          },
        ],
      }]

      response = addresses.validate_address(params)

      expect(response[0].status).to(eq(expected_response[0][:status]))

      expect(response[0].original_address.name).to(eq(expected_response[0][:original_address][:name]))
      expect(response[0].original_address.phone).to(eq(expected_response[0][:original_address][:phone]))
      expect(response[0].original_address.company_name).to(eq(expected_response[0][:original_address][:company_name]))
      expect(response[0].original_address.address_line1).to(eq(expected_response[0][:original_address][:address_line1]))
      expect(response[0].original_address.address_line2).to(eq(expected_response[0][:original_address][:address_line2]))
      expect(response[0].original_address.address_line3).to(eq(expected_response[0][:original_address][:address_line3]))
      expect(response[0].original_address.city_locality).to(eq(expected_response[0][:original_address][:city_locality]))
      expect(response[0].original_address.state_province).to(eq(expected_response[0][:original_address][:state_province]))
      expect(response[0].original_address.postal_code).to(eq(expected_response[0][:original_address][:postal_code]))
      expect(response[0].original_address.country_code).to(eq(expected_response[0][:original_address][:country_code]))
      expect(response[0].original_address.address_residential_indicator).to(eq(expected_response[0][:original_address][:address_residential_indicator]))

      expect(response[0].matched_address.name).to(eq(expected_response[0][:matched_address][:name]))
      expect(response[0].matched_address.phone).to(eq(expected_response[0][:matched_address][:phone]))
      expect(response[0].matched_address.company_name).to(eq(expected_response[0][:matched_address][:company_name]))
      expect(response[0].matched_address.address_line1).to(eq(expected_response[0][:matched_address][:address_line1]))
      expect(response[0].matched_address.address_line2).to(eq(expected_response[0][:matched_address][:address_line2]))
      expect(response[0].matched_address.address_line3).to(eq(expected_response[0][:matched_address][:address_line3]))
      expect(response[0].matched_address.city_locality).to(eq(expected_response[0][:matched_address][:city_locality]))
      expect(response[0].matched_address.state_province).to(eq(expected_response[0][:matched_address][:state_province]))
      expect(response[0].matched_address.postal_code).to(eq(expected_response[0][:matched_address][:postal_code]))
      expect(response[0].matched_address.country_code).to(eq(expected_response[0][:matched_address][:country_code]))
      expect(response[0].matched_address.address_residential_indicator).to(eq(expected_response[0][:matched_address][:address_residential_indicator]))

      expect(response[0].messages[0].code).to(eq(expected_response[0][:messages][0][:code]))
      expect(response[0].messages[0].message).to(eq(expected_response[0][:messages][0][:message]))
      expect(response[0].messages[0].type).to(eq(expected_response[0][:messages][0][:type]))
      expect(response[0].messages[0].detail_code).to(eq(expected_response[0][:messages][0][:detail_code]))

      expect(response[0].messages[1].code).to(eq(expected_response[0][:messages][1][:code]))
      expect(response[0].messages[1].message).to(eq(expected_response[0][:messages][1][:message]))
      expect(response[0].messages[1].type).to(eq(expected_response[0][:messages][1][:type]))
      expect(response[0].messages[1].detail_code).to(eq(expected_response[0][:messages][1][:detail_code]))

      expect(response[0].messages[2].code).to(eq(expected_response[0][:messages][2][:code]))
      expect(response[0].messages[2].message).to(eq(expected_response[0][:messages][2][:message]))
      expect(response[0].messages[2].type).to(eq(expected_response[0][:messages][2][:type]))
      expect(response[0].messages[2].detail_code).to(eq(expected_response[0][:messages][2][:detail_code]))
    end

    it "should validate address and return AddressStatus::ERROR status" do
      params = [{
        address_line1: "Winchester Blvd",
        city_locality: "San Jose",
        state_province: "CA",
        postal_code: "78756",
        country_code: "US",
      }]
      expected_response = [{
        status: ShipEngine::Enums::AddressStatus::ERROR,
        original_address: {
          name: nil,
          phone: nil,
          company_name: nil,
          address_line1: "Winchester Blvd",
          address_line2: nil,
          address_line3: nil,
          city_locality: "San Jose",
          state_province: "CA",
          postal_code: "78756",
          country_code: "US", "address_residential_indicator": "unknown",
        },
        matched_address: {
          name: nil,
          phone: nil,
          company_name: nil,
          address_line1: "WINCHESTER BLVD",
          address_line2: "",
          address_line3: nil,
          city_locality: "SAN JOSE",
          state_province: "CA",
          postal_code: "95128-2092",
          country_code: "US",
          address_residential_indicator: ShipEngine::Enums::AddressResidentialIndicatorTypes::UNKNOWN,
        },
        messages: [
          {
            code: "a1004",
            message: "Address not found",
            type: ShipEngine::Enums::MessageStatus::WARNING,
            detail_code: nil,
          },
          {
            code: "a1004",
            message: "Insufficient or Incorrect Address Data",
            type: ShipEngine::Enums::MessageStatus::WARNING,
            detail_code: nil,
          },
        ],
      }]

      response = addresses.validate_address(params)

      expect(response[0].status).to(eq(expected_response[0][:status]))

      expect(response[0].original_address.name).to(eq(expected_response[0][:original_address][:name]))
      expect(response[0].original_address.phone).to(eq(expected_response[0][:original_address][:phone]))
      expect(response[0].original_address.company_name).to(eq(expected_response[0][:original_address][:company_name]))
      expect(response[0].original_address.address_line1).to(eq(expected_response[0][:original_address][:address_line1]))
      expect(response[0].original_address.address_line2).to(eq(expected_response[0][:original_address][:address_line2]))
      expect(response[0].original_address.address_line3).to(eq(expected_response[0][:original_address][:address_line3]))
      expect(response[0].original_address.city_locality).to(eq(expected_response[0][:original_address][:city_locality]))
      expect(response[0].original_address.state_province).to(eq(expected_response[0][:original_address][:state_province]))
      expect(response[0].original_address.postal_code).to(eq(expected_response[0][:original_address][:postal_code]))
      expect(response[0].original_address.country_code).to(eq(expected_response[0][:original_address][:country_code]))
      expect(response[0].original_address.address_residential_indicator).to(eq(expected_response[0][:original_address][:address_residential_indicator]))

      expect(response[0].matched_address.name).to(eq(expected_response[0][:matched_address][:name]))
      expect(response[0].matched_address.phone).to(eq(expected_response[0][:matched_address][:phone]))
      expect(response[0].matched_address.company_name).to(eq(expected_response[0][:matched_address][:company_name]))
      expect(response[0].matched_address.address_line1).to(eq(expected_response[0][:matched_address][:address_line1]))
      expect(response[0].matched_address.address_line2).to(eq(expected_response[0][:matched_address][:address_line2]))
      expect(response[0].matched_address.address_line3).to(eq(expected_response[0][:matched_address][:address_line3]))
      expect(response[0].matched_address.city_locality).to(eq(expected_response[0][:matched_address][:city_locality]))
      expect(response[0].matched_address.state_province).to(eq(expected_response[0][:matched_address][:state_province]))
      expect(response[0].matched_address.postal_code).to(eq(expected_response[0][:matched_address][:postal_code]))
      expect(response[0].matched_address.country_code).to(eq(expected_response[0][:matched_address][:country_code]))
      expect(response[0].matched_address.address_residential_indicator).to(eq(expected_response[0][:matched_address][:address_residential_indicator]))

      expect(response[0].messages[0].code).to(eq(expected_response[0][:messages][0][:code]))
      expect(response[0].messages[0].message).to(eq(expected_response[0][:messages][0][:message]))
      expect(response[0].messages[0].type).to(eq(expected_response[0][:messages][0][:type]))
      expect(response[0].messages[0].detail_code).to(eq(expected_response[0][:messages][0][:detail_code]))

      expect(response[0].messages[1].code).to(eq(expected_response[0][:messages][1][:code]))
      expect(response[0].messages[1].message).to(eq(expected_response[0][:messages][1][:message]))
      expect(response[0].messages[1].type).to(eq(expected_response[0][:messages][1][:type]))
      expect(response[0].messages[1].detail_code).to(eq(expected_response[0][:messages][1][:detail_code]))
    end
  end
end
