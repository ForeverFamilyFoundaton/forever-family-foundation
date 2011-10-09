ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'factory_girl_devise_fix.rb'

include ActionDispatch::TestProcess

class ActionController::TestCase
  include Devise::TestHelpers
end

FactoryGirl.class_eval do
  # Default content type is +image/jpg+
  def attachment(name, path, content_type = "image/jpg")
    path_with_rails_root = "#{Rails.root}/#{path}"
    uploaded_file = fixture_file_upload(path_with_rails_root, content_type)
    add_attribute(name, uploaded_file)
  end
end

class Test::Unit::TestCase
  def page
    Capybara::Node::Simple.new(@response.body)
  end
end