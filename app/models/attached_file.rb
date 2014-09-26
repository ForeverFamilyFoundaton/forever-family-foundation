class AttachedFile < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true

  paperclip_opts = { styles: { thumb: '200x200>' } }
  if Rails.env.production?
    paperclip_opts.merge!(
      {
        storage: :s3,
        s3_credentials: {
          bucket: 'fff_attached_files',
          access_key_id: ENV['AWS_ACCESS_KEY_ID'],
          secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
        }
      }
    )
  end

  has_attached_file :attachment, paperclip_opts

  do_not_validate_attachment_file_type :attachment

  attr_accessible :attachment, :kind

  before_post_process :image?

  SUPPORTED_IMAGE_FORMATS = ["image/jpeg", "image/png", "image/gif", "image/bmp"]
  SUPPORTED_IMAGES_REGEX = Regexp.new('\A(' + SUPPORTED_IMAGE_FORMATS.join('|') + ')\Z')

  def image?
    (attachment_content_type =~ SUPPORTED_IMAGES_REGEX).present?
  end

end
