class RadioArchive < ActiveRecord::Base
  has_many :external_links, as: :linkable, dependent: :destroy
  accepts_nested_attributes_for :external_links  
  has_one :attached_file, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attached_file
  attr_accessible :date, :format, :guest, :title, :attached_file_attributes, :external_links_attributes
  
  validates :title, presence: true
end
