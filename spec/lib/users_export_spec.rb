require "users_export.rb"

describe UsersExport do
  before do
    @users = FactoryGirl.create_list(:user, 5)
  end
  
  subject { UsersExport.new(@users) }

  describe "#users" do
    it "should have users" do
      expect(subject.users).to eq(@users) 
    end
  end

  describe "#to_csv" do
    it "has CSV" do
      file = File.read("../fixtures/users.csv")
      expect(subject.to_csv).to eq(file) 
    end
  end

  after do
    User.destroy_all
  end
end