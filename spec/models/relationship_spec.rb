RSpec.describe Relationship, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # let(:valid_params) {{title: 'A Title', author: 'John Doe', amazon_link: 'http://google.com'}}

  it { should have_many(:known_deads) }

  it { should have_many(:users).through(:known_deads) }

  it { should validate_uniqueness_of :name }
end
