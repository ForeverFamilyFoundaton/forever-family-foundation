class CmsImage < ActiveRecord::Base
  has_attached_file :image
end
