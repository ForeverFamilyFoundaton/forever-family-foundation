class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles
  has_one :address, :as => :addressable
  has_one :business
  has_many :family_members
  has_many :adg_answers
  has_many :notes
  has_many :user_preference_selections
  has_many :preferences, through: :user_preference_selections
  has_many :profile_preferences, -> {where("preferences.preference_type = 'Profile'")},
    through: :user_preference_selections,
    source: :preference
  has_many :adg_preferences, -> { where("preferences.preference_type = 'ADG'") },
    through: :user_preference_selections,
    source: :preference

  state_machine do
    state :new
    state :confirmed

    event :confirm do
      transition all => :confirmed
    end
  end

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :family_members

  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :email_confirmation, :middle_name, :cell_phone, :work_phone, :home_phone, :address_attributes, :family_members_attributes, :profile_preference_ids, :terms_of_use, :is_business, :state, :fax, :enrolled_from, :id, :membership_number, :problems, :do_not_mail, :enrolled_at

  validates_presence_of     :email
  validates_confirmation_of :email, :if => :email_changed?
  validates_uniqueness_of   :email, case_sensitive: false, allow_blank: true, if: :email_changed?
  validates_format_of       :email, with: email_regexp, allow_blank: true, if: :email_changed?
  validates_uniqueness_of   :membership_number
  validates_presence_of   :membership_number
  validates_associated :address
  validates_presence_of :address
  validates_presence_of :first_name, :last_name
  validates_acceptance_of :terms_of_use

  #TODO: remove if we begin using confirmable
  before_validation :assign_membership_number
  # before_create :build_address
  after_create :welcome_message

 # validates_presence_of     :password, :if => :password_required?
 # validates_confirmation_of :password, :if => :password_required?
 # validates_length_of       :password, :within => password_length, :allow_blank => true, :message => I18n.t('')
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


  def confirm!
    welcome_message
    super
  end


private

  def assign_membership_number
    if membership_number.blank?
      self.membership_number = User.maximum(:membership_number).to_i + 1
    end
  end

  def welcome_message
    if welcome_template = CmsPage.where(reference_string: 'Email::Welcome').first
      UserMailer.welcome_email(self, welcome_template).deliver
    end
  end
end

