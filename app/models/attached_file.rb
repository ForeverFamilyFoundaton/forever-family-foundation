class AttachedFile < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true

  if Rails.env.production?
    Paperclip::Attachment.default_options[:s3_credentials].merge! bucket: 'fff_attached_files'
  end

  has_attached_file :attachment, { styles: { thumb: '100x100>' } }

  do_not_validate_attachment_file_type :attachment

  attr_accessible :attachment, :kind

  before_post_process :image?

  SUPPORTED_IMAGE_FORMATS = ["image/jpeg", "image/png", "image/gif", "image/bmp"]
  SUPPORTED_IMAGES_REGEX = Regexp.new('\A(' + SUPPORTED_IMAGE_FORMATS.join('|') + ')\Z')

  def image?
    (attachment_content_type =~ SUPPORTED_IMAGES_REGEX).present?
  end

end
