class CmsImage < ActiveRecord::Base

  if Rails.env.production?
    Paperclip::Attachment.default_options[:s3_credentials].merge! bucket: 'fff_cms_images'
  end

  has_attached_file :image, { styles: { thumb: '100x100>' } }

  do_not_validate_attachment_file_type :image

  attr_accessible :title, :image, :caption

end
