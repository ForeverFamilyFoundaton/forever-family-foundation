class Export < ActiveRecord::Base
  paperclip_opts = {}
  paperclip_opts.merge!({ bucket: 'fff_cms_exports' })

  has_attached_file :file, paperclip_opts

  validates_attachment_content_type :file, content_type: "text/plain"
  after_create :save_csv

  def save_csv
    self.file = File.new(generate_csv)
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
    csv = UsersExport.new(users).to_csv
    file = CsvFileGenerator.new("users", csv).run
  end

end
