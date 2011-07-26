require 'test_helper'

class UserTest < ActiveSupport::TestCase

  should have_one :address
  should have_many :family_members
  should validate_presence_of :first_name
  should validate_presence_of :last_name
  should have_many :preferences
  should have_many :profile_preferences
  should have_many :adg_preferences

  should_not allow_mass_assignment_of :crypted_password
  should_not allow_mass_assignment_of :password_salt
  should_not allow_mass_assignment_of :single_access_token
  should_not allow_mass_assignment_of :perishable_token
  should_not allow_mass_assignment_of :login_count
  should_not allow_mass_assignment_of :failed_login_count
  should_not allow_mass_assignment_of :last_request_at
  should_not allow_mass_assignment_of :current_login_at
  should_not allow_mass_assignment_of :last_login_at
  should_not allow_mass_assignment_of :current_login_ip
  should_not allow_mass_assignment_of :last_login_ip
end
