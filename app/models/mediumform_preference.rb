class MediumformPreference < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :name, :preference_type

  has_many :mediumform_preference_selections
  has_many :mediumforms, through: :mediumform_preference_selections

  scope :selfclassify_preferences, -> { where(preference_type: 'SelfClassify') }
  scope :practice_preferences, -> { where(preference_type: 'Practice') }

end
