class AttachedFile < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true

  paperclip_opts = { styles: { thumb: '100x100>' }}
  if Rails.env.production?
    paperclip_opts.merge!(S3_STORAGE_OPTS).merge!(bucket: 'fff_attached_files')
  end

  has_attached_file :attachment, { styles: { thumb: "200x200>" } }.merge(paperclip_opts)

  attr_accessible :attachment, :kind

  before_post_process :image?

  SUPPORTED_IMAGE_FORMATS = ["image/jpeg", "image/png", "image/gif", "image/bmp"]
  SUPPORTED_IMAGES_REGEX = Regexp.new('\A(' + SUPPORTED_IMAGE_FORMATS.join('|') + ')\Z')

  def image?
    (attachment_content_type =~ SUPPORTED_IMAGES_REGEX).present?
  end

end
