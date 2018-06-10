class Mediumform < ActiveRecord::Base
  belongs_to :user
  # belongs_to :belief_type

  # has_many :known_deads, inverse_of: :mediumform, dependent: :destroy
  # accepts_nested_attributes_for :known_deads, reject_if: proc { |a| a[:name].blank? }, allow_destroy: true;

  # has_many :relationships, through: :known_deads

  #filter :medium_preferences, as: :check_boxes

  validates :user_id, presence: true
  validate :signature_and_checkbox # see below custom validation

  has_many :mediumform_preference_selections
  has_many :mediumform_preferences, through: :mediumform_preference_selections
  has_many :selfclassify_preferences, -> {where("preference_type = 'SelfClassify'")},
    through: :mediumform_preference_selections,
    source: :mediumform_preference
  has_many :practice_preferences, -> {where("preference_type = 'Practice'")},
    through: :mediumform_preference_selections,
    source: :mediumform_preference

  attr_accessible :mediumform_preference_ids

  attr_accessible :user_id
  attr_accessible :personalprofessional
  #, :professional_name, :professional_address_line1, :professional_address_line2
  #attr_accessible :professional_phone_number, :professional_email

  # attr_accessible :personal_name, :personal_address_line1, :personal_address_line2
  # attr_accessible :personal_phone_number, :personal_email

  attr_accessible :other_businesses, :health_healing
  
  attr_accessible :MEPC_Failed, :MEPC_Removed, :admin_notes
  attr_accessible :website, :blog, :facebook, :pinterest, :instagram, :twitter, :youtube, :other
  
  attr_accessible :sitter1, :sitter2, :sitter3, :sitter4, :sitter5
  attr_accessible :SitterA, :SitterB, :SitterC, :SitterD, :SitterE

  attr_accessible :medium_status, :test_date, :application_date

  attr_accessible :alt_first_name, :alt_middle_name, :alt_last_name
  attr_accessible :alt_address_line1, :alt_address_line2
  attr_accessible :alt_work_phone, :alt_mobile_phone, :alt_home_phone
  attr_accessible :alt_work_email, :alt_home_email
  attr_accessible :alt_address, :alt_city, :alt_state, :alt_zipcode, :alt_country, :alt_email

  attr_accessible :other_primary_owner, :other_related, :other_not_related
  attr_accessible :became_aware, :immediate_family, :life_event, :specific_goal, :medium_priority
  attr_accessible :different_info, :hear_about_fff, :medium_history, :mediumship_training
  attr_accessible :kind_of_readings, :self_classify, :other_classify
  attr_accessible :other_certification
  attr_accessible :ethics1, :ethics2, :ethics3, :ethics4

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
