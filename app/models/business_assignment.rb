class BusinessAssignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :business
  validates_presence_of :user_id, :business_id
end
