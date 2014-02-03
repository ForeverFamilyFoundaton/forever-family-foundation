class FamilyMember < ActiveRecord::Base
  belongs_to :user

  attr_accessible :first_name, :last_name, :relationship

  def name_and_relationship
    [first_name, last_name].join(' ') + ': ' + relationship.to_s
  end
end

