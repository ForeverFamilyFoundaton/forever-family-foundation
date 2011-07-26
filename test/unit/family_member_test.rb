require 'test_helper'

class FamilyMemberTest < ActiveSupport::TestCase
  should belong_to :user
  should_not allow_mass_assignment_of :user_id
end
