class Business < ActiveRecord::Base
  has_one :address, :as => :addressable
  #has_many :business_assignments
  #has_many :users, :through => :business_assignments
  has_many :attached_files, :as => :attachable
  has_one :business_card, :class_name => 'AttachedFile', :conditions => "kind = 'business_card'", :as => :attachable
  has_one :business_logo, :class_name => 'AttachedFile', :conditions => "kind = 'business_logo'", :as => :attachable
  has_one :web_banner, :class_name => 'AttachedFile', :conditions => "kind = 'web_banner'", :as => :attachable
  has_one :promotional_media_mp3, :class_name => 'AttachedFile', :conditions => "kind = 'promotional_media_mp3'", :as => :attachable
  has_one :promotional_media_upload, :class_name => 'AttachedFile', :conditions => "kind = 'promotional_media_upload'", :as => :attachable
  has_one :billing_address
  belongs_to :user

  validates_presence_of :name,  :contact_name, :contact_phone, :contact_email
  validates_confirmation_of :contact_email, :if => :contact_email_changed?
  validates_associated :address ,:billing_address
  #validates_uniqueness_of :user_id #For now, one user is allowed to register only one company as UI is not defined to handle multiple businesses

  attr_accessible :name, :contact_name, :contact_phone, :contact_email,:contact_email_confirmation, :fax, :address_attributes, :billing_address_attributes, :completed_step
  attr_accessible :business_card_attributes, :business_logo_attributes, :web_banner_attributes
  attr_accessible :promotional_media_mp3_attributes, :promotional_media_upload_attributes
  attr_accessible :promotional_info_additional_notes , :use_business_card_for_web_banner, :promotional_media_text
  attr_accessible :promotional_media_additional_notes, :promotional_media_mp3, :promotional_media_upload

  accepts_nested_attributes_for :address, :business_card, :business_logo, :web_banner, :promotional_media_mp3
  accepts_nested_attributes_for :promotional_media_upload ,:billing_address
end

