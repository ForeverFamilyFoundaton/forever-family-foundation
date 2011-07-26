require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  should belong_to :addressable
  should validate_presence_of :address
  should validate_presence_of :city
  should validate_presence_of :state
  should validate_presence_of :zip
  should allow_mass_assignment_of :address
  should allow_mass_assignment_of :city
  should allow_mass_assignment_of :state
  should allow_mass_assignment_of :zip
  should_not allow_mass_assignment_of :addressable_id
  should_not allow_mass_assignment_of :addressable_type
end
