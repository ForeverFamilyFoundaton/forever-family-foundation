class CmsImage < ActiveRecord::Base
  has_attached_file :image, {styles: { thumb: '100x100>' }}.merge(S3_STORAGE_OPTS)
end
