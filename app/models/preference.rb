class Preference < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :name, :preference_type

  has_many :user_preference_selections
  has_many :users, through: :user_preference_selection

  scope :profile_preferences, -> { where(preference_type: 'Profile') }
  scope :subscription_preferences, -> { where(preference_type: 'Subscription') }
  #scope :medium_preferences, -> { where(preference_type: 'Medium') }
  scope :adg_preferences, -> { where(preference_type: 'ADG') }

end
