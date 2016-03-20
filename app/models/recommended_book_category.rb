class RecommendedBookCategory < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :name

  has_many :recommended_book_groups
  has_many :recommended_books, through: :recommended_book_groups
end
