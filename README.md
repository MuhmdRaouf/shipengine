[![ShipEngine](https://avatars.githubusercontent.com/u/42709242?s=200&v=4)](https://shipengine.com)

ShipEngine Ruby SDK
===================
 Ruby SDK for [ShipEngine API](https://shipengine.com) offering low-level access as well as convenience methods.

Quick Start
===========

Install ShipEngine via [RubyGems](https://rubygems.org/)
```bash
gem install shipengine_ruby
```
- The only configuration requirement is an [API Key](https://www.shipengine.com/docs/auth/#api-keys).

Configure ShipEngine
```ruby
ShipEngine.configure do |config|
  config.api_key = ShipEngine::Constants::API_KEY
  config.base_url = ShipEngine::Constants::PROD_URL
  config.retries = ShipEngine::Constants::RETRIES
  config.timeout = ShipEngine::Constants::TIMEOUT
  config.page_size = ShipEngine::Constants::PAGE_SIZE
end
```
or set the environment variable `API_KEY`