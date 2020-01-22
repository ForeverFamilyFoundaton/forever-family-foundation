RSpec.describe KnownDead, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # let(:valid_params) {{title: 'A Title', author: 'John Doe', amazon_link: 'http://google.com'}}

  it { should belong_to(:user) }
  it { should belong_to(:relationship) }
  it { should belong_to(:sitterform) }

  it { should allow_mass_assignment_of :name }
  it { should allow_mass_assignment_of :relationship_id }
  it { should allow_mass_assignment_of :sitterform_id }
end
