RSpec.describe AdgAnswer do
  it { should belong_to :user }
  it { should belong_to :adg_question }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :adg_question_id }
  it { should_not allow_mass_assignment_of :user_id }
end
