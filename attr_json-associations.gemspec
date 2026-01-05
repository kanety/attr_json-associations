# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'attr_json/associations/version'

Gem::Specification.new do |spec|
  spec.name          = "attr_json-associations"
  spec.version       = AttrJson::Associations::VERSION
  spec.authors       = ["Yoshikazu Kaneta"]
  spec.email         = ["kaneta@sitebridge.co.jp"]
  spec.summary       = %q{An association extension for attr_json}
  spec.description   = %q{An association extension for attr_json}
  spec.homepage      = "https://github.com/kanety/attr_json-associations"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.0"

  spec.add_dependency "attr_json", ">= 2.0"
  spec.add_dependency "activerecord", ">= 7.0"
  spec.add_dependency "activesupport", ">= 7.0"

  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "logger"
end
