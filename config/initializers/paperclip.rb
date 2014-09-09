S3_STORAGE_OPTS = Rails.env.production? ? {
  storage: :s3,
  s3_credentials: {
    bucket: 'fff_attached_files',
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }
} : {}
