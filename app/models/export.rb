class Export < ActiveRecord::Base
  paperclip_opts = {}
  if Rails.env.production? || Rails.env.development?
    paperclip_opts.merge!({
      storage: :s3,
      s3_credentials: {
        bucket: 'fff-cms-exports',
        access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
      }
    })
  end

  has_attached_file :file, paperclip_opts
  validates_attachment_content_type :file, content_type: "text/plain"
  after_create :save_csv


  def save_csv
    self.file = File.new(generate_csv)
    puts file.inspect
    save!
    ExportMailer.ready(self).deliver_now
  end
  handle_asynchronously :save_csv

  def has_file?
    !self.file.try(:path).nil?
  end

  private
  def generate_csv
    users = User.all
    puts users.inspect
    csv = UsersExport.new(users).to_csv
    file = CsvFileGenerator.new("users", csv).run
    file
  end

end
