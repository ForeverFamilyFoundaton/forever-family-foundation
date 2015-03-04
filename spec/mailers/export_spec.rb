require "rails_helper"

RSpec.describe Export, :type => :mailer do
  describe "ready" do
    let(:mail) { Export.ready }

    it "renders the headers" do
      expect(mail.subject).to eq("Ready")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
