class EmbededLink < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :em_linkable, polymorphic: true
end
