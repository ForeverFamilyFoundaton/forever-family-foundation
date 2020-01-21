RSpec.describe RecommendedBook do
  let(:valid_params) {{title: 'A Title', author: 'John Doe', amazon_link: 'http://google.com'}}

  it { should have_many(:recommended_book_groups) }
  it { should have_many(:recommended_book_categories).through(:recommended_book_groups) }

  it { should validate_presence_of :title }

  it { should allow_mass_assignment_of :title }
  it { should allow_mass_assignment_of :author }
  it { should allow_mass_assignment_of :amazon_link }
  it { should allow_mass_assignment_of :recommended_book_category_ids }
  it { should allow_mass_assignment_of :recommended_book_ids }

end
