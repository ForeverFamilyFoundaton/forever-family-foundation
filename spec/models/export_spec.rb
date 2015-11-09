require 'rails_helper'

describe Export do
  before do
    @users = FactoryGirl.create_list(:user, 2)
    ActionMailer::Base.delivery_method = :test
    Delayed::Worker.delay_jobs = false
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
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
  end
end
