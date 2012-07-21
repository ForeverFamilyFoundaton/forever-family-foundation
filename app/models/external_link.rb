class ExternalLink < ActiveRecord::Base
  belongs_to :radio_archive
  attr_accessible :sort_order, :text, :url
end
