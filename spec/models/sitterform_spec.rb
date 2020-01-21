RSpec.describe Sitterform, :sitterform, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:valid_params) {{title: 'A Title', author: 'John Doe', amazon_link: 'http://google.com'}}

  it { should have_many(:known_deads) }
  it { should have_many(:relationships) }
  # it { should have_many(:recommended_book_categories).through(:recommended_book_groups) }

  it { should allow_mass_assignment_of :user_id }

  it { should allow_mass_assignment_of :user_id }
  it { should allow_mass_assignment_of :phone }
  it { should allow_mass_assignment_of :alt_email }
  it { should allow_mass_assignment_of :cell }
  it { should allow_mass_assignment_of :website }
  it { should allow_mass_assignment_of :facebook }
  it { should allow_mass_assignment_of :pinterest }
  it { should allow_mass_assignment_of :instagram }
  it { should allow_mass_assignment_of :twitter }
  it { should allow_mass_assignment_of :youtube }
  it { should allow_mass_assignment_of :blog }
  it { should allow_mass_assignment_of :related_contact_info }
  it { should allow_mass_assignment_of :been_to_medium }
  it { should allow_mass_assignment_of :belief_type_id }
  it { should allow_mass_assignment_of :lost_loved_one }
  it { should allow_mass_assignment_of :signature }
  it { should allow_mass_assignment_of :known_deads_attributes }
end
