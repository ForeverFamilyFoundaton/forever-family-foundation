RSpec.describe BusinessAssignment do
  it { should belong_to :user }
  it { should belong_to :business }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :business_id }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :business_id }
end
