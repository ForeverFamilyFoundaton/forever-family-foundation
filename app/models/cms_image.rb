class CmsImage < ActiveRecord::Base
  paperclip_opts = { styles: { thumb: '100x100>' } }

  paperclip_opts.merge!({ bucket: ENV['AWS_S3_IMAGE_FILES'] })

  has_attached_file :attachment, paperclip_opts

  has_attached_file :image, paperclip_opts
  do_not_validate_attachment_file_type :image

  attr_accessible :title, :image, :caption
end
