class RadioArchive < ActiveRecord::Base
  paginates_per 10

  has_many :embeded_links, as: :em_linkable, dependent: :destroy
  accepts_nested_attributes_for :embeded_links

  has_one :attached_file, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attached_file

  attr_accessible :date, :format, :guest, :title, :attached_file_attributes, :external_links_attributes, :embeded_links_attributes

  validates :title, presence: true
end
