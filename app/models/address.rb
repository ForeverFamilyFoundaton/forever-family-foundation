class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true

  validates_presence_of :address, :city, :state, :zip
  attr_accessible :address, :city, :state, :zip
  
  def to_s
    "#{address} #{city}, #{state} #{zip}"
  end
end
