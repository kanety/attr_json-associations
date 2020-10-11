# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../dummy/config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

ActiveRecord::Base.logger = Logger.new(STDOUT) if ENV['DEBUG']
#ActiveRecord::Migration.maintain_test_schema!

#Rails.application.load_tasks
#RSpec.configure do |config|
#  config.before(:suite) do
#    Rake::Task['db:seed'].invoke
#  end
#end
