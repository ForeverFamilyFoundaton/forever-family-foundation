class Export < ActiveRecord::Base
  has_attached_file :file
  validates_attachment_content_type :file, content_type: "text/plain" 

  def save_csv 
    self.file = File.new(generate_csv)
    save!
    ExportMailer.ready(self).deliver
  end

  def generate_csv
    users = User.all
    csv = UsersExport.new(users).to_csv
    file = CsvFileGenerator.new("users", csv).run
  end
  handle_asynchronously :save_csv 
end
