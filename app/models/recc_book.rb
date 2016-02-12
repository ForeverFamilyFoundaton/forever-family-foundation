class ReccBook < ActiveRecord::Base

  has_many :recc_book_groups
  has_many :recc_book_categories, through: :recc_book_groups

  validates :title, presence: true
  
  attr_accessible :title, :category, :author, :amazon_link, :recc_book_category_ids, :recc_book_ids


end
