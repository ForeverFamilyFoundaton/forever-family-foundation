RSpec.describe Export do
  before do
    @users = FactoryGirl.create_list(:user, 2)
  end

  after do
    @users.map(&:destroy)
  end

  it { is_expected.to have_attached_file(:file) }

  describe "#save_csv" do
    subject { Export.create }

    it "attaches file" do
      file = User.all.to_comma
      expect(Paperclip.io_adapters.for(subject.file).read).to eq(file)
    end

    it "sends email" do
      expect { Export.create }.to change {
        ActionMailer::Base.deliveries.count
      }.by(1)
    end
  end
end
