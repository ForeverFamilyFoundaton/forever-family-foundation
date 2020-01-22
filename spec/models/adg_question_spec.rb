RSpec.describe AdgQuestion do
  it { should validate_presence_of :question }
  it { should allow_mass_assignment_of :question }
  it { should allow_mass_assignment_of :show_radio }
end
