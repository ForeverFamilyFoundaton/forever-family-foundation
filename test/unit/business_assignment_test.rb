require 'test_helper'

class BusinessAssignmentTest < ActiveSupport::TestCase
  should belong_to :user
  should belong_to :business
  should validate_presence_of :user_id
  should validate_presence_of :business_id
  should validate_presence_of :user_id
  should validate_presence_of :business_id
end
