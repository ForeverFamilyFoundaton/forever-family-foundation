# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'factory_girl_devise_fix.rb'
require 'action_dispatch/testing/integration'
require 'features/feature_helper'
require 'webmock/rspec'
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

WebMock.allow_net_connect!

# MOVE ME
module ControllerMacros

  def setup_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
    end
  end
end

include ActionDispatch::TestProcess

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, :type => :controller
  config.extend ControllerMacros, :type => :controller


  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
end

# MOVE ME
RSpec::Matchers.define :accept_nested_attributes_for do |association|
  match do |model|
    @model = model
    @nested_att_present = model.respond_to?("#{association}_attributes=".to_sym)
    if @nested_att_present && @reject
      model.send("#{association}_attributes=".to_sym,[@reject])
      @reject_success = model.send("#{association}").empty?
    end
    if @nested_att_present && @accept
      model.send("#{association}_attributes=".to_sym,[@accept])
      @accept_success = ! (model.send("#{association}").empty?)
    end
    @nested_att_present && ( @reject.nil? || @reject_success ) && ( @accept.nil? || @accept_success )
  end

  failure_message_for_should do
    messages = []
    messages << "expected #{@model.class} to accept nested attributes for #{association}" unless @nested_att_present
    messages << "expected #{@model.class} to reject values #{@reject.inspect} for association #{association}" unless @reject_success
    messages << "expected #{@model.class} to accept values #{@accept.inspect} for association #{association}" unless @accept_success
    messages.join(", ")
  end

  description do
    desc = "accept nested attributes for #{expected}"
    if @reject
      desc << ", but reject if attributes are #{@reject.inspect}"
    end
  end

  chain :but_reject do |reject|
    @reject = reject
  end

  chain :and_accept do |accept|
    @accept = accept
  end
end
