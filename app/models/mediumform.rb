class Mediumform < ActiveRecord::Base
  belongs_to :user
  belongs_to :belief_type

  has_many :known_deads, inverse_of: :mediumform, dependent: :destroy
  accepts_nested_attributes_for :known_deads, reject_if: proc { |a| a[:name].blank? }, allow_destroy: true;

  has_many :relationships, through: :known_deads

  validates :user_id, presence: true
  validate :signature_and_checkbox # see below custom validation

  attr_accessible :user_id, :phone, :alt_email, :cell, :website, :facebook, :pinterest, :instagram
  attr_accessible :twitter, :youtube, :blog, :related_contact_info, :been_to_medium, :belief_type_id
  attr_accessible :lost_loved_one, :signature, :known_deads_attributes, :medium_contacts
  attr_accessible :signature_checkbox

  private
    # if signature is signed, checkbox MUST also be ticked
    def signature_and_checkbox
      if !self.signature.empty?
        if !self.signature_checkbox
          self.errors.add(:signature_checkbox, 'needs to be checked')
        end
      end
    end
end
