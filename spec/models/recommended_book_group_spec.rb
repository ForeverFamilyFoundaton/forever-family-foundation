RSpec.describe RecommendedBookGroup do

  it { should belong_to(:recommended_book) }
  it { should belong_to(:recommended_book_category) }

  it { should allow_mass_assignment_of :recommended_book_category_ids }
  it { should allow_mass_assignment_of :recommended_book_ids }

end
