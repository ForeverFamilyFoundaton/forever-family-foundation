class Business < ActiveRecord::Base
  TOTAL_REG_STEPS = 4

  has_one :address, as: :addressable
  has_many :attached_files, as: :attachable
  has_one :business_card, -> { where(kind: 'business_card') }, class_name: 'AttachedFile', as: :attachable
  has_one :business_logo, -> { where(kind: 'business_logo') }, class_name: 'AttachedFile', as: :attachable
  has_one :web_banner, -> { where(kind: 'business_banner') }, class_name: 'AttachedFile', as: :attachable
  has_one :promotional_media_mp3, -> { where(kind: 'promotional_media_mp3') }, class_name: 'AttachedFile', as: :attachable
  has_one :promotional_media_upload, -> { where(kind: 'promotional_media_upload') }, class_name: 'AttachedFile', as: :attachable
  has_one :billing_address
  belongs_to :user

  validates_presence_of :name,  :contact_name, :contact_phone, :contact_email
  validates_confirmation_of :contact_email, :if => :contact_email_changed?
  validates_associated :address ,:billing_address

  attr_accessible :name, :contact_name, :contact_phone, :contact_email,:contact_email_confirmation, :fax, :address_attributes, :billing_address_attributes, :completed_step, :business_card_attributes, :business_logo_attributes, :web_banner_attributes, :promotional_media_mp3_attributes, :promotional_media_upload_attributes, :promotional_info_additional_notes , :use_business_card_for_web_banner, :promotional_media_text, :promotional_media_additional_notes, :promotional_media_mp3, :promotional_media_upload

  attr_accessor :credit_card_number, :credit_card_token, :credit_card_expires_on
  accepts_nested_attributes_for :address,:billing_address, reject_if: proc { |attrs| attrs.all?(&:blank?) }
  accepts_nested_attributes_for  :business_card, :business_logo, :web_banner, :promotional_media_mp3, :promotional_media_upload, reject_if: proc { |attrs| attrs[:attachment].blank? }

  def completed_step?(i)
    completed_step >= i
  end

  def complete_step!(step)
    update_attribute(:completed_step, step.to_i) if completed_step <= TOTAL_REG_STEPS
  end

  def next_step
    completed_step + 1
  end

  def reg_complete?
    completed_step == TOTAL_REG_STEPS
  end

  def registered?
    completed_step >= 1
  end
end

