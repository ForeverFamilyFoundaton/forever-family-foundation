RSpec.describe Address do
  it { should belong_to :addressable }
  it { should validate_presence_of :address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :zip }
  it { should allow_mass_assignment_of :address }
  it { should allow_mass_assignment_of :city }
  it { should allow_mass_assignment_of :state }
  it { should allow_mass_assignment_of :zip }
  it { should_not allow_mass_assignment_of :addressable_id }
  it { should_not allow_mass_assignment_of :addressable_type }
end
