class AttachedFile < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true

  paperclip_opts = { styles: { thumb: '200x200>' } }

  # April 10, 2016
  # This block setup to use S3 in development and production environments
  #
  if Rails.env.production? || Rails.env.development?
    paperclip_opts.merge!(
      {
        storage: :s3,
        s3_region: ENV['AWS_REGION'],
        s3_credentials: {
          bucket: ENV['AWS_S3_BUCKET_NAME'],
          access_key_id: ENV['AWS_ACCESS_KEY_ID'],
          secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
        }
      }
    )
  end

  has_attached_file :attachment, paperclip_opts

  before_save :set_content_type

  #
  # explicitly set some content_type using file extension
  # if not one of the explicits, then default to what paperclip thinks it is
  #
  def set_content_type
    extension = File.extname(attachment_file_name).downcase
    case extension
      when '.pdf'
        self.attachment_content_type = 'application/pdf'
      when '.txt', ''
        self.attachment_content_type = 'text/plain'
      when '.csv.'
        self.attachment_content_type = 'text/csv'
      when '.jpg'
        self.attachment_content_type = 'image/jpeg'
      when '.png'
        self.attachment_content_type = 'image/png'
      when '.xml'
        self.attachment_content_type = 'text/xml'
      when '.bmp'
        self.attachment_content_type = 'image/bmp'
    end
    self.attachment.options.merge!(s3_headers: {
                                    'Content-Type' => self.attachment_content_type || 'text/plain'
                                    })
    self.attachment.send :initialize_storage
  end

  do_not_validate_attachment_file_type :attachment

  attr_accessible :attachment, :kind

  before_post_process :image?

  SUPPORTED_IMAGE_FORMATS = ["image/jpeg", "image/png", "image/gif", "image/bmp"]
  SUPPORTED_IMAGES_REGEX = Regexp.new('\A(' + SUPPORTED_IMAGE_FORMATS.join('|') + ')\Z')

  def image?
    (attachment_content_type =~ SUPPORTED_IMAGES_REGEX).present?
  end

end

