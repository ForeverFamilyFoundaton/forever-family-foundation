require 'rails_helper'

RSpec.describe ExportsController, :type => :controller do
  before do
    FactoryGirl.create_list(:user, 3)
    Delayed::Worker.delay_jobs = false  
    ActionMailer::Base.delivery_method = :test
  end

  after do
    Export.destroy_all
  end

  let(:valid_attributes) {
    
  }

  let(:invalid_attributes) {
    
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ExportsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all exports as @exports" do
      puts Export.count
      export = Export.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:exports)).to eq([export])
    end
  end

  describe "GET show" do
    it "assigns the requested export as @export" do
      export = Export.create! valid_attributes
      get :show, {:id => export.to_param}, valid_session
      expect(assigns(:export)).to eq(export)
    end

    it "downloads the file" do
      export = Export.create! valid_attributes
      get :show, {:id => export.to_param}, valid_session
      expect(response.header['Content-Type']).to eq('text/csv')
    end

    context 'when Export has no file' do
      it "renders the page" do
        export = Export.create! valid_attributes
        get :show, {:id => export.to_param}, valid_session
        expect(response).to render_template("show")
      end
    end
  end

  describe "GET new" do
    it "assigns a new export as @export" do
      get :new, {}, valid_session
      expect(assigns(:export)).to be_a_new(Export)
    end
  end

  describe "GET edit" do
    it "assigns the requested export as @export" do
      export = Export.create! valid_attributes
      get :edit, {:id => export.to_param}, valid_session
      expect(assigns(:export)).to eq(export)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Export" do
        expect {
          post :create, {:export => valid_attributes}, valid_session
        }.to change(Export, :count).by(1)
      end

      it "assigns a newly created export as @export" do
        post :create, {:export => valid_attributes}, valid_session
        expect(assigns(:export)).to be_a(Export)
        expect(assigns(:export)).to be_persisted
      end

      it "saves the users csv" do
        users = User.all.to_comma
        post :create, {:export => valid_attributes}, valid_session
        expect(Paperclip.io_adapters.for(assigns(:export).file).read).to eq(users)
      end

      it "redirects to the created export" do
        post :create, {:export => valid_attributes}, valid_session
        expect(response).to redirect_to(Export.last)
      end
    end
  end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested export" do
  #       export = Export.create! valid_attributes
  #       put :update, {:id => export.to_param, :export => new_attributes}, valid_session
  #       export.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested export as @export" do
  #       export = Export.create! valid_attributes
  #       put :update, {:id => export.to_param, :export => valid_attributes}, valid_session
  #       expect(assigns(:export)).to eq(export)
  #     end

  #     it "redirects to the export" do
  #       export = Export.create! valid_attributes
  #       put :update, {:id => export.to_param, :export => valid_attributes}, valid_session
  #       expect(response).to redirect_to(export)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns the export as @export" do
  #       export = Export.create! valid_attributes
  #       put :update, {:id => export.to_param, :export => invalid_attributes}, valid_session
  #       expect(assigns(:export)).to eq(export)
  #     end

  #     it "re-renders the 'edit' template" do
  #       export = Export.create! valid_attributes
  #       put :update, {:id => export.to_param, :export => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  describe "DELETE destroy" do
    it "destroys the requested export" do
      export = Export.create! valid_attributes
      expect {
        delete :destroy, {:id => export.to_param}, valid_session
      }.to change(Export, :count).by(-1)
    end

    it "redirects to the exports list" do
      export = Export.create! valid_attributes
      delete :destroy, {:id => export.to_param}, valid_session
      expect(response).to redirect_to(exports_url)
    end
  end

end
