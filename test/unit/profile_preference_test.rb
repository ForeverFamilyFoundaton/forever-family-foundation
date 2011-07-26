require 'test_helper'

class PreferenceTest < ActiveSupport::TestCase
  should validate_presence_of :name
  should have_many :users
end
