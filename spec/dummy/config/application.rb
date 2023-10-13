require_relative 'boot'

# Pick the frameworks you want:
require "active_record/railtie"
require "active_job/railtie"

Bundler.require(*Rails.groups)
require "attr_json-associations"

module Dummy
  class Application < Rails::Application
    config.load_defaults Rails::VERSION::STRING.to_f
  end
end
