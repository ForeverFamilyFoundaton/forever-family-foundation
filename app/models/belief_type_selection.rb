class BeliefTypeSelection < ActiveRecord::Base
  belongs_to :sitterform
  belongs_to :belief_type

  attr_accessible :sitterform_id, :belief_type_id
end
