require 'rails_helper'

RSpec.describe "Exports", :type => :request do
  describe "GET /exports" do
    it "works! (now write some real specs)" do
      get exports_path
      expect(response.status).to be(200)
    end
  end
end
