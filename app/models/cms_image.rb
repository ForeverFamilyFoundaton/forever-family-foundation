class CmsImage < ActiveRecord::Base
  has_attached_file :image,
  styles: { thumb: '100x100>' },
  storage: :s3,
  bucket: 'fff_cms_images',
  s3_credentials: {
    access_key_id: 'AKIAIMDZEEZXRWDDHWCA',
    secret_access_key: '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'
  }
end
