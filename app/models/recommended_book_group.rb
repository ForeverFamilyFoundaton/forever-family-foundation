class RecommendedBookGroup < ActiveRecord::Base
  belongs_to :recommended_book
  belongs_to :recommended_book_category

  attr_accessible :recommended_book_category_ids, :recommended_book_ids
end
