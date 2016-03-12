class ReccBookGroup < ActiveRecord::Base
  belongs_to :recc_book
  belongs_to :recc_book_category

  attr_accessible :recc_book_category_ids, :recc_book_ids
end
