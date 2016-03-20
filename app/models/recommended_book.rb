class RecommendedBook < ActiveRecord::Base

  has_many :recommended_book_groups
  has_many :recommended_book_categories, through: :recommended_book_groups

  validates :title, presence: true
  
  attr_accessible :title, :category, :author, :amazon_link, :recommended_book_category_ids, :recommended_book_ids


end
