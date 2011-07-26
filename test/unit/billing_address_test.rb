require 'test_helper'

class BillingAddressTest < ActiveSupport::TestCase
  should belong_to :business
  should validate_presence_of :city
  should validate_presence_of :address
  should validate_presence_of :country
  should validate_presence_of :state
  should validate_presence_of :zip
  should allow_mass_assignment_of :city
  should allow_mass_assignment_of :address
  should allow_mass_assignment_of :country
  should allow_mass_assignment_of :state
  should allow_mass_assignment_of :zip
end
