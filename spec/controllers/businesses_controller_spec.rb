require 'spec_helper'

describe BusinessesController do
  setup_user

  before do
    @business = FactoryGirl.create(:business, :user_id => @user.id)
    sign_in @user
  end

  context "on get new" do
    before do
      get :new, :user_id => @user.id
    end
    it { should respond_with :success }
    it { should render_template :new }
  end

  context "on create business" do
    before do
      post :create, business: FactoryGirl.attributes_for(:business, name: 'Testing Corp'), step: 1
    end
    it { should assign_to :business }
    it 'redirects to payment' do
      business = Business.find_by_name('Testing Corp')
      response.should redirect_to user_business_payment_path(@user, business)
    end
  end

  context 'on process payment' do
    before do
      post :create, credit_card: {}
    end
    it {assigns(:business).should be_kind_of(Business)}
    it {response.should be_success}
    it {response.should render_template :new}
  end

  context "on business params error" do
    before do
      post :create, "business" => {}, step: 1
    end
    it {assigns(:business).should be_kind_of(Business)}
    it {response.should be_success}
    it {response.should render_template :new}
  end

  context "on get edit" do
    before do
      business = FactoryGirl.create(:business, :user_id => @user.id)
      get :edit, :user_id => @user.id, :id => business.id, step: 1
    end
    it {should respond_with :success}
    it {should render_template :edit}
  end

  context "on updating business" do
    before do
      put :update, "business" => {}, :id => @business.id, :step => '1'
    end
    it {should assign_to :business}
    it {response.should redirect_to  user_path(@user)}
  end

  context "on get step 2" do
    before do
      get :register, user_id: @user.id, id: @business.id, step: 2
    end
    it {should respond_with :success}
    it {should render_template :register}
  end

  context "on finishing step 2" do
    before do
      put :register, business: {}, user_id: @user.id, id: @business.id, step: '2'
    end
    it {should assign_to :business}
    it {
      response.should redirect_to user_business_register_path(@user, @business, step: 3)
    }
  end

  context "on get step 3" do
    before do
      get :register, :user_id => @user.id, :id => @business.id, :step => '3'
    end
    it {should respond_with :success}
    it {should render_template :register}
  end

  context "on finishing step 3" do
    before do
      put :register, "business" => {}, :user_id => @user.id, :id => @business.id, step: 3
   end
    it {should assign_to :business}
    it {
      response.should redirect_to user_business_register_path(@user, @business, step: 4)
    }
  end

  context "on get step 4" do
    before do
      get :edit, :user_id => @user.id, :id => @business.id, :step => '4'
    end
    it {should respond_with :success}
    it {should render_template :edit}
  end

  context "on finishing step 4" do
    before do
      put :register, business: {}, user_id: @user.id, id: @business.id, step: 4
    end
    it {should assign_to :business}
    it {response.should redirect_to user_path(@user) }
  end

end
