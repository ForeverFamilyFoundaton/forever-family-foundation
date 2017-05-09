class Sitterform < ActiveRecord::Base
  belongs_to :user
  belongs_to :belief_type

  has_many :known_deads, dependent: :destroy
  accepts_nested_attributes_for :known_deads, reject_if: proc { |a| a[:name].blank? }, allow_destroy: true;

  has_many :relationships, through: :known_deads
  validates :user_id, presence: true
  has_many :known_deads, inverse_of: :sitterform

  attr_accessible :user_id, :phone, :alt_email, :cell, :website, :facebook, :pinterest, :instagram
  attr_accessible :twitter, :youtube, :blog, :related_contact_info, :been_to_medium, :belief_type_id
  attr_accessible :lost_loved_one, :signature, :known_deads_attributes, :medium_contacts
end
