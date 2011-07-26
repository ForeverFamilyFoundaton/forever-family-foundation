class AttachedFile < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true

  has_attached_file :attachment, :path => ":rails_root/data/:class/:id/:style/:basename.:extension",
                                 :url => "/data/:class/:id/:style/:filename"  
  attr_accessible :attachment, :kind
end
