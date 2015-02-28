require "users_export.rb"

describe Export do
  before do
    @users = FactoryGirl.create_list(:user, 2)
  end

  after do
    @users.map(&:destroy) 
  end

  it { is_expected.to have_attached_file(:file) }

  describe "#attach_file" do
    subject { Export.create } 

    it "attaches file" do
      file = UsersExport(@users).to_csv
      expect(subject.file).to eq(file)
    end
  end
end