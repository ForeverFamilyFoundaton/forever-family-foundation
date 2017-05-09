class Relationship < ActiveRecord::Base
  has_many :known_deads
  has_many :users, through: :known_deads

  validates_uniqueness_of :name
  attr_accessible :name, :typeof
end
