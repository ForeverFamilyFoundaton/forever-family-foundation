class Sitterform < ActiveRecord::Base
  belongs_to :user
  belongs_to :belief_type

  has_many :known_deads, inverse_of: :sitterform, dependent: :destroy
  accepts_nested_attributes_for :known_deads, reject_if: proc { |a| a[:name].blank? }, allow_destroy: true;

  has_many :relationships, through: :known_deads

  validates_presence_of :belief_type_id
  validates_presence_of :user_id
  validate :relationship_and_date
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

    def relationship_and_date
      self.known_deads.each do |d|
        if !d[:name].blank?
          if d[:relationship_id] == 1
            self.errors.add(:relationship, 'needs to be selected for ' + d[:name])
          end
          if d[:year_of_death].empty?
            self.errors.add(:year_of_death, 'needs to be filled in for ' + d[:name])
          elsif (d[:year_of_death].to_i < 1900 || d[:year_of_death].to_i > Date.current.year)
            self.errors.add(:year_of_death, 'must be between 1900- ' + Date.current.year.to_s + " for "+ d[:name])
          end
        end
      end
    end
end
