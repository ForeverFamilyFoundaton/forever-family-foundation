class AttachedFile < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true

  has_attached_file :attachment, :styles => { :thumb => "200x200>" }

  attr_accessible :attachment, :kind

  before_post_process :image?

private

  SUPPORTED_IMAGE_FORMATS = ["image/jpeg", "image/png", "image/gif", "image/bmp"]
  SUPPORTED_IMAGES_REGEX = Regexp.new('\A(' + SUPPORTED_IMAGE_FORMATS.join('|') + ')\Z')

  def image?
    (attachment_content_type =~ SUPPORTED_IMAGES_REGEX).present?
  end

end
