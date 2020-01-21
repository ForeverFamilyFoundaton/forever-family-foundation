RSpec.describe AttachedFile do
  it { should belong_to :attachable }
  it { should allow_mass_assignment_of :attachment }
  it { should allow_mass_assignment_of :kind }
end
