class CmsImage < ActiveRecord::Base
  has_attached_file :image,
  styles: { thumb: '100x100>' },
  storage: :s3,
  bucket: 'fff_cms_images',
  s3_credentials: {
    access_key_id: ENV['S3_KEY'],
    secret_access_key: ENV['S3_SECRET']
  }
end
