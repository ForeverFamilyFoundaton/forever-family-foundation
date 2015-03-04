class Export < ActiveRecord::Base
  has_attached_file :file
  validates_attachment_content_type :file, content_type: "text/csv" 
  before_create :generate_csv_file 

  def generate_csv_file 
    users = User.all
    csv = UsersExport.new(users).to_csv
    file = CsvFileGenerator.new("users", csv).run
    self.file = File.new(file)
  end
end
