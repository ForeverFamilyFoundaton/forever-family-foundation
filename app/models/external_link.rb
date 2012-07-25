class ExternalLink < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  attr_accessible :sort_order, :text, :url
end
