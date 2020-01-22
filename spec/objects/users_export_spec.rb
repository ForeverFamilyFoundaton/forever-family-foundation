RSpec.describe UsersExport do
  before do
    @users = FactoryBot.create_list(:user, 3)
  end

  subject { UsersExport.new(@users) }

  describe "#users" do
    it "should have users" do
      expect(subject.users).to eq(@users)
    end
  end

  describe "#to_csv" do
    it "has CSV" do
      allow(File).to receive(:read).and_return(subject.to_csv)
      csv_path = File.expand_path("../../fixtures/users.csv", __FILE__)
      file = File.read(csv_path)
      expect(subject.to_csv).to eq(file)
    end
  end

  after do
    User.destroy_all
  end
end
