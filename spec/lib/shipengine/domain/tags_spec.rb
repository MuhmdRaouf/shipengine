# frozen_string_literal: true

RSpec.describe(ShipEngine::Domain::Tags) do
  let(:tags) { ShipEngine::Domain::Tags.new }

  context "Get Tags" do
    it "should get tags" do
      params = {}
      expected_response = { tags: [{ name: "Fragile" }] }

      request = stub_request(
        :get,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.tags.root}"
      ).with(query: params).to_return(status: 200, body: expected_response.to_json)

      response = tags.list_tags

      assert_requested(request, times: 1)

      expect(response.tags[0].name).to(eq(expected_response[:tags][0][:name]))
    end
  end

  context "Create Tag" do
    it "should create tag" do
      tag_name = "Fragile"
      params = {}
      expected_response = { name: "Fragile" }

      request = stub_request(
        :post,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.tags.root}/#{tag_name}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = tags.create_tag(tag_name: tag_name, params: params)

      assert_requested(request, times: 1)

      expect(response.name).to(eq(expected_response[:name]))
    end
  end

  context "Delete Tag" do
    it "should delete tag" do
      tag_name = "Fragile"
      params = {}
      expected_response = {}

      request = stub_request(
        :delete,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.tags.root}/#{tag_name}"
      ).with(body: params).to_return(status: 204, body: expected_response.to_json)

      response = tags.delete_tag(tag_name: tag_name, params: params)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end

  context "Update Tag Name" do
    it "should get tag name" do
      tag_name = "Fragile"
      new_tag_name = "Non-Fragile"
      params = {}
      expected_response = {}

      request = stub_request(
        :put,
        "#{ShipEngine::Constants::PROD_URL}#{ShipEngine::Constants::PATHS.v1.tags.root}/#{tag_name}/#{new_tag_name}"
      ).with(body: params).to_return(status: 200, body: expected_response.to_json)

      response = tags.update_tag(tag_name: tag_name, new_tag_name: new_tag_name, params: params)

      assert_requested(request, times: 1)

      expect(response).to(eq(expected_response))
    end
  end
end
