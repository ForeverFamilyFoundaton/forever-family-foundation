class FamilyMember < ActiveRecord::Base
  belongs_to :user

  attr_accessible :first_name, :last_name, :relationship
end

