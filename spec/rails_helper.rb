# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"


  VCR.configure do |c|
    #c.allow_http_connections_when_no_cassette = true
    c.cassette_library_dir = 'fixtures/vcr_cassettes'
    c.hook_into :webmock

    c.filter_sensitive_data('<GITHUB_USERNAME>') {ENV['GITHUB_USERNAME']}
    c.filter_sensitive_data('<GITHUB_PASSWORD>') {ENV['GITHUB_PASSWORD']}
  end
end
