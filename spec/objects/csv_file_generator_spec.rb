describe CsvFileGenerator do
  
  describe "#new" do
    it "should take a file argument" do
      expect { CsvFileGenerator.new("users", "Hello world") }.to_not raise_error
    end
  end
  
  describe "#run" do
    subject { CsvFileGenerator.new("users", "Hello world").run } 
    
    it { is_expected.to be_a(Tempfile) }

    it "writes the contents" do
      expect(File.read(subject)).to eq("Hello world") 
    end
  end
end