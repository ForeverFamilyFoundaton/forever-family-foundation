class CmsImage < ActiveRecord::Base

  paperclip_opts = { styles: { thumb: '100x100>' } }
  if Rails.env.production?
    paperclip_opts.merge!({
      storage: :s3,
      s3_credentials: {
        bucket: 'fff_cms_images',
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
