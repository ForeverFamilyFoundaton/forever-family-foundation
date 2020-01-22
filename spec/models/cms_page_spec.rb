RSpec.describe CmsPage do
  it { should validate_presence_of :reference_string }
  it { should_not allow_mass_assignment_of :parent_id }
  it { should_not allow_mass_assignment_of :position }
end
