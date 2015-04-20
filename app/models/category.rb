class Category < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name 

  has_many :user_categories
  has_many :users, through: :user_categories
  accepts_nested_attributes_for :users
end
