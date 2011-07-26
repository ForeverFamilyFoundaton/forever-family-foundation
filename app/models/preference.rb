class Preference < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :name, :preference_type

  has_many :users, :through => :user_preference_selection

  scope :profile_preferences, :conditions => {:preference_type => 'Profile'}
  scope :adg_preferences, :conditions => {:preference_type => 'ADG'}
end
