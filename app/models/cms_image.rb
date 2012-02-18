class CmsImage < ActiveRecord::Base
  has_attached_file :image,
  styles: { thumb: '100x100>' },
  storage: :s3,
  bucket: '4ever_family_foundation',
  s3_credentials: {
    access_key_id: 'AKIAJY2QBAGM7WQAIDDQ',
    secret_access_key: '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'
  }
end
