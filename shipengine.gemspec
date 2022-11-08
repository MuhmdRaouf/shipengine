# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "shipengine/version"

Gem::Specification.new do |spec|
  spec.name                   = "shipengine_ruby"
  spec.summary                = "Ruby SDK for ShipEngine"
  spec.homepage               = "https://github.com/MuhmdRaouf/shipengine"
  spec.license                = "MIT"

  spec.email                  = ["mohammed@raouf.me"]
  spec.authors                = ["Mohammed Abdel Raouf"]

  spec.version                = ShipEngine::VERSION::VERSION
  spec.platform               = Gem::Platform::RUBY
  spec.required_ruby_version  = ">= 2.5"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    %x(git ls-files -z).split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency("faraday", "~> 1.0")
  spec.add_runtime_dependency("faraday_middleware", "~> 1.0")
  spec.add_runtime_dependency("hashie", "~> 3.4")

  spec.add_development_dependency("bundler", "~> 1.17")
  spec.add_development_dependency("pry", "~> 0.14")
  spec.add_development_dependency("rake", "~> 13.0")
  spec.add_development_dependency("rspec", "~> 3.12")
  spec.add_development_dependency("rubocop", "~> 1.28")
  spec.add_development_dependency("rubocop-performance", "~> 1.13")
  spec.add_development_dependency("rubocop-shopify", "~> 2.5")
  spec.add_development_dependency("webmock", "~> 3.18")
end
