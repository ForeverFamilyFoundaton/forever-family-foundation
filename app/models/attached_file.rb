class AttachedFile < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true

  has_attached_file :attachment,
    :storage => :s3,
    :bucket => 'fff_attachments',
    :s3_credentials => {
      :access_key_id => 'AKIAIMDZEEZXRWDDHWCA',
      :secret_access_key => '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'
    },
    :styles => { :thumb => "200x200>" }

  attr_accessible :attachment, :kind

  before_post_process :image?

private

  SUPPORTED_IMAGE_FORMATS = ["image/jpeg", "image/png", "image/gif", "image/bmp"]
  SUPPORTED_IMAGES_REGEX = Regexp.new('\A(' + SUPPORTED_IMAGE_FORMATS.join('|') + ')\Z')

  def image?
    (attachment_content_type =~ SUPPORTED_IMAGES_REGEX).present?
  end

end
