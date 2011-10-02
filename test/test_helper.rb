ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

include ActionDispatch::TestProcess

FactoryGirl.class_eval do
  # Default content type is +image/jpg+
  def attachment(name, path, content_type = "image/jpg")
    path_with_rails_root = "#{Rails.root}/#{path}"
    uploaded_file = fixture_file_upload(path_with_rails_root, content_type)
    add_attribute(name, uploaded_file)
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include Devise::TestHelpers
end


