class KnownDead < ActiveRecord::Base
  belongs_to :user
  belongs_to :relationship
  belongs_to :sitterform

  attr_accessible :id, :name, :relationship_id, :sitterform_id, :year_of_death
end
