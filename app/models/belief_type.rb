class BeliefType < ActiveRecord::Base
  has_many :sitterforms
  attr_accessible :name
end
