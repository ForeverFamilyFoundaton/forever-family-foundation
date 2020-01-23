RSpec.describe BusinessesController do
  setup_user

  before do
    @business = FactoryBot.create(:business, :user_id => @user.id)
    sign_in @user
  end

  context "on get new" do
    before do
      get :new, params: { :user_id => @user.id }
    end
    it { should respond_with :success }
    it { should render_template :new }
  end

  context "on create business" do
    before do
      post :create, params: {
        user_id: @user.id,
        business: FactoryBot.attributes_for(:business, name: 'Testing Corp'),
        step: 1
      }
    end

    it 'redirects to payment' do
      business = Business.find_by_name('Testing Corp')
      expect(response).to redirect_to user_business_payment_path(@user, business)
    end
  end

  context 'on process payment' do
    before do
      post :create, params: {
        user_id: @user.id,
        credit_card: {} }
    end
    it { expect(assigns(:business)).to be_kind_of(Business)}
    it {expect(response).to be_successful }
    it {expect(response).to render_template :new}
  end

  context "on business params error" do
    before do
      post :create, params: {
        user_id: @user.id,
        "business" => {}, step: 1 }
    end
    it { expect(assigns(:business)).to be_kind_of(Business) }
    it {expect(response).to be_successful }
    it {expect(response).to render_template :new}
  end

  context "on get edit" do
    before do
      business = FactoryBot.create(:business, :user_id => @user.id)
      get :edit, params: { :user_id => @user.id, :id => business.id, step: 1 }
    end
    it {should respond_with :success}
    it {should render_template :edit}
  end

  context "on updating business" do
    before do
      put :update, params: {
        user_id: @user.id,
        "business" => {}, :id => @business.id, :step => '1'
      }
    end
    it {expect(response).to redirect_to  user_path(@user)}
  end

  context "on get step 2" do
    before do
      get :register, params: {
        user_id: @user.id, business_id: @business.id, step: 2
      }
    end
    it {should respond_with :success}
    it {should render_template :register}
  end

  context "on finishing step 2" do
    before do
      put :register, params: {
        business: {}, user_id: @user.id, business_id: @business.id, step: '2'
      }
    end
    it {
      expect(response).to redirect_to user_business_register_path(@user, @business, step: 3)
    }
  end

  context "on get step 3" do
    before do
      get :register, params: {
        user_id: @user.id,
        business_id: @business.id,
        step: '3'
      }
    end
    it { should respond_with :success }
    it { should render_template :register }
  end

  context "on finishing step 3" do
    before do
      put :register, params: {
        "business" => {}, :user_id => @user.id, :business_id => @business.id, step: 3
      }
    end

    it {
      expect(response).to redirect_to user_business_register_path(@user, @business, step: 4)
    }
  end

  context "on get step 4" do
    before do
      get :edit, params: {
        :user_id => @user.id, :id => @business.id, :step => '4'
      }
    end
    it {should respond_with :success}
    it {should render_template :edit}
  end

  context "on finishing step 4" do
    before do
      put :register, params: {
        business: {}, user_id: @user.id, business_id: @business.id, step: 4
      }
    end
    it {expect(response).to redirect_to user_path(@user) }
  end

end
