class BillingAddress < ActiveRecord::Base
  belongs_to :business
  validates_presence_of :city, :address, :country, :state ,:zip
  attr_accessible :city, :address, :country, :state ,:zip
end

