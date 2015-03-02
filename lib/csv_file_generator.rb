class CsvFileGenerator
  attr_accessor :name, :contents
  def initialize(name, contents)
    @name = name
    @contents = contents
  end

  def run
    file = Tempfile.new([@name, '.csv'], Rails.root.join("tmp"))
    file.write(@contents)
    file.close
    
    ActionDispatch::Http::UploadedFile.new({
      tempfile: file
    })
  end
end