RSpec.describe ExceptionsController do
  describe "GET #not_found" do
    it "returns http success" do
      get :not_found
      expect(response).to have_http_status 404
    end
  end

  describe "GET #internal_error" do
    it "returns http success" do
      get :internal_error
      expect(response).to have_http_status 500
    end
  end

  describe "GET #unacceptable" do
    it "returns http success" do
      get :unacceptable
      expect(response).to have_http_status 422
    end
  end
end
