RSpec.describe FamilyMember do
  it { should belong_to :user }
  it { should_not allow_mass_assignment_of :user_id }
end
