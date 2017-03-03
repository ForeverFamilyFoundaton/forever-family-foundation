class CmsImage < ActiveRecord::Base

  paperclip_opts = { styles: { thumb: '100x100>' } }
  if Rails.env.production? || Rails.env.development?
    logger.debug "----- hello -----"
    logger.debug 'AWS Region -----' + ENV['AWS_REGION'].to_s + '-----'
    paperclip_opts.merge!({
      storage: :s3,
      s3_region: ENV['AWS_REGION'],
      s3_credentials: {
        bucket: ENV['AWS_S3_IMAGE_FILES'],
        access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
      }
    })
  end

  has_attached_file :attachment, paperclip_opts

  has_attached_file :image, paperclip_opts

  do_not_validate_attachment_file_type :image

  attr_accessible :title, :image, :caption
end
