class AttachedFile < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  
  has_attached_file :attachment,
    # :storage => :s3,
    # :bucket => '4ever_family_foundation',
    # :s3_credentials => {
    #   :access_key_id => 'AKIAJY2QBAGM7WQAIDDQ',
    #   :secret_access_key => '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'
    # },
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
