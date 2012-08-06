class ExternalLink < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  attr_accessible :sort_order, :text, :url
  
  validates :url, presence: true, format: { with: URI::regexp(%w(http https)) }
  validates :text, presence: true
end
