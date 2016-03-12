class ReccBookCategory < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :name

  has_many :recc_book_groups
  has_many :recc_books, through: :recc_book_groups
end
