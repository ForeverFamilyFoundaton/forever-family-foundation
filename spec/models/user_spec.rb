require 'spec_helper'

describe User do
  it { should have_one :address }
  it { should have_many :family_members }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should have_many :preferences }
  it { should have_many :profile_preferences }
  it { should have_many :adg_preferences }

  it { should_not allow_mass_assignment_of :crypted_password }
  it { should_not allow_mass_assignment_of :password_salt }
  it { should_not allow_mass_assignment_of :single_access_token }
  it { should_not allow_mass_assignment_of :perishable_token }
  it { should_not allow_mass_assignment_of :login_count }
  it { should_not allow_mass_assignment_of :failed_login_count }
  it { should_not allow_mass_assignment_of :last_request_at }
  it { should_not allow_mass_assignment_of :current_login_at }
  it { should_not allow_mass_assignment_of :last_login_at }
  it { should_not allow_mass_assignment_of :current_login_ip }
  it { should_not allow_mass_assignment_of :last_login_ip }

  it 'increments a sequential id' do 
    
  end
end
