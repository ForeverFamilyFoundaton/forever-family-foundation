class CmsImage < ActiveRecord::Base
  has_attached_file :image,
  styles: { thumb: '100x100>' },
  storage: :s3,
  s3_credentials: {
    bucket: 'fff_cms_images',
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }
end
