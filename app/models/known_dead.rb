class KnownDead < ActiveRecord::Base
  belongs_to :user
  belongs_to :relationship
  belongs_to :sitterform
end
