class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles
  has_one :address, :as => :addressable
  has_one :business
  #has_many :business_assignments
  #has_many :businesses, :through => :business_assignments
  has_many :family_members
  has_many :adg_answers
  has_many :notes
  has_many :user_preference_selections
  has_many :preferences, :through => :user_preference_selections
  has_many :profile_preferences, :through => :user_preference_selections, :source => :preference, :conditions => "preferences.preference_type = 'Profile'", :class_name => 'Preference'
  has_many :adg_preferences, :through => :user_preference_selections, :source => :preference, :conditions => "preferences.preference_type = 'ADG'", :class_name => 'Preference'

  state_machine do
    state :new
    state :confirmed

    event :confirm do
      transition all => :confirmed
    end
  end

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :family_members, :reject_if => proc { |attributes| attributes['first_name'].blank? }

  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :email_confirmation, :middle_name, :cell_phone, :work_phone, :home_phone, :address_attributes, :family_members_attributes, :profile_preference_ids, :terms_of_use, :is_business, :welcomed

  validates_presence_of     :email
  validates_confirmation_of :email, :if => :email_changed?
  validates_uniqueness_of   :email, :case_sensitive => false, :allow_blank => true, :if => :email_changed?
  validates_format_of       :email, :with  => email_regexp, :allow_blank => true, :if => :email_changed?
  validates_associated :address
  validates_presence_of :first_name, :last_name# , :address
  validates_acceptance_of :terms_of_use

#  validates_presence_of     :password, :if => :password_required?
#  validates_confirmation_of :password, :if => :password_required?
#  validates_length_of       :password, :within => password_length, :allow_blank => true, :message => I18n.t('')
#
  def biz?
    business.present?
  end

  def has_role?(role)
    roles.detect{|r| r.name == role}
  end

  def full_name
    [first_name, middle_name, last_name].compact.join(' ')
  end

  def needs_to_be_welcomed?
    return true if !biz? && reg_complete? && !welcomed?
    return true if biz? && business.reg_complete? && !welcomed?
  end
end

