require "rails_helper"

RSpec.describe ExportMailer, :type => :mailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  describe "ready" do
    before do
      @users = FactoryGirl.create_list(:user, 2)
      @export = Export.create
    end

    after do
      @users.map(&:destroy)
    end

    let(:mail) { ExportMailer.ready(@export) }

    it "renders the headers" do
      expect(mail.subject).to eq("Users export ready")
      expect(mail.to).to eq(["4everfam@optonline.net"])
      expect(mail.from).to eq(["admin@foreverfamilyfoundation.com"])
    end

    it "has the attachment url" do
      expect(mail).to have_body_text(@export.file.url)
    end
  end

end
