# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "http_basic_authentication/version"
require "http_basic_authentication/infos"

Gem::Specification.new do |spec|
  spec.name          = "redmine-http_basic_authentication"
  spec.version       = HttpBasicAuthentication::VERSION
  spec.authors       = HttpBasicAuthentication::Infos::AUTHORS.keys
  spec.email         = HttpBasicAuthentication::Infos::AUTHORS.values
  spec.summary       = HttpBasicAuthentication::Infos::DESCRIPTION
  spec.description   = HttpBasicAuthentication::Infos::DESCRIPTION
  spec.homepage      = HttpBasicAuthentication::Infos::URL
  spec.license       = HttpBasicAuthentication::Infos::LICENSE

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4.2.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rubocop"
end
