class Mediumform < ActiveRecord::Base
  belongs_to :user
  # belongs_to :belief_type

  # has_many :known_deads, inverse_of: :mediumform, dependent: :destroy
  # accepts_nested_attributes_for :known_deads, reject_if: proc { |a| a[:name].blank? }, allow_destroy: true;

  # has_many :relationships, through: :known_deads

  validates :user_id, presence: true
  validate :signature_and_checkbox # see below custom validation

  attr_accessible :user_id
  attr_accessible :use_professional, :professional_name, :professional_address_line1, :professional_address_line2
  attr_accessible :professional_phone_number, :professional_email
  attr_accessible :use_personal, :personal_name, :personal_address_line1, :personal_address_line2
  attr_accessible :personal_phone_number, :personal_email

  attr_accessible :other_businesses, :health_healing
      
  attr_accessible :website, :blog, :facebook, :pinterest, :instagram, :twitter, :youtube, :other
  attr_accessible :sitter1, :sitter2, :sitter3, :sitter4, :sitter5

  attr_accessible :ethics1, :ethics2, :ethics3, :ethics4
  attr_accessible :other_primary_owner, :other_related, :other_not_related
  attr_accessible :became_aware, :immediate_family, :life_event, :specific_goal, :medium_priority
  attr_accessible :different_info, :hear_about_fff, :medium_history, :mediumship_training
  attr_accessible :kind_of_readings
  attr_accessible :self_classify, :other_classify

  attr_accessible :signature_checkbox, :signature

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
