# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../dummy/config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

if ENV['DEBUG'] == '1'
  Rails.logger = Logger.new(STDOUT)
  Rails.application.config.log_level = :debug
end
