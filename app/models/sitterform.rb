class Sitterform < ActiveRecord::Base
  belongs_to :user
  has_many :known_deads, dependent: :destroy
  accepts_nested_attributes_for :known_deads, allow_destroy: true;
  has_many :relationships, through: :known_deads
  validates :user_id, presence: true
  has_many :known_deads

  attr_accessible :user_id, :phone, :alt_email, :cell, :website, :facebook, :pinterest, :instagram
  attr_accessible :twitter, :youtube, :blog, :related_contact_info, :been_to_medium, :consider_yourself
  attr_accessible :lost_loved_one, :signature, :known_deads_attributes
end
