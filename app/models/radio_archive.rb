class RadioArchive < ActiveRecord::Base
  has_many :external_links
  has_one :attached_file, :as => :attachable
  accepts_nested_attributes_for :attached_file
  attr_accessible :date, :format, :guest, :title, :attached_file_attributes
end
