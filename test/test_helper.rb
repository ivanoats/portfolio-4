require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "capybara/rails"
#require "capybara/rspec/matchers"
require "minitest/rails/capybara"

require "database_cleaner"
# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:

require "capybara/webkit"
Capybara.javascript_driver = :webkit

# Uncomment for awesome colorful output
 require "minitest/pride"
# class ActionDispatch::IntegrationTest
#   include Rails.application.routes.url_helpers
#   #include Capybara::RSpecMatchers
#   include Capybara::DSL
# end

DatabaseCleaner.strategy = :truncation

class MiniTest::Spec
  before :each do
    puts "I am definitely in the before each\n\n\n\n\n\n"
    DatabaseCleaner.start
  end

  after :each do
    puts "I am definitely in the after each\n\n\n\n\n\n"

    DatabaseCleaner.clean
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here..

  def sign_in_user(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in "Password", with: "password"
    click_on "Sign in"
  end
end


