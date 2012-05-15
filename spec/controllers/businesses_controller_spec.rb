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
    should redirect_to("the business step 2 page") {
      business = Business.find_by_name('Testing Corp')
      user_business_register_path(@user, business, :step => '2')
    }
  end

  context "on business params error" do
    setup do
      post :create, "business" => {}, step: 1
    end
    should assign_to :business
    should respond_with :success
    should render_template :new
  end

  context "on get edit" do
    setup do
      business = FactoryGirl.create(:business, :user_id => @user.id)
      get :edit, :user_id => @user.id, :id => business.id, step: 1
    end
    should respond_with :success
    should render_template :edit
  end

  context "on updating business" do
    setup do
      put :update, "business" => {}, :id => @business.id, :step => '1'
    end
    should assign_to :business
    should redirect_to('user show') { user_path(@user) }
  end

  context "on get step 2" do
    setup do
      get :register, user_id: @user.id, id: @business.id, step: 2
    end
    should respond_with :success
    should render_template :register
  end

  context "on finishing step 2" do
    setup do
      put :register, business: {}, user_id: @user.id, id: @business.id, step: '2'
    end
    should assign_to :business
    should redirect_to('step 3') {
      # user_business_register_path(@user, step: 3)
      "/users/#{@user.id}/businesses/#{@user.business.id}/register?step=3"
    }
  end

  context "on get step 3" do
    setup do
      get :register, :user_id => @user.id, :id => @business.id, :step => '3'
    end
    should respond_with :success
    should render_template :register
  end

  context "on finishing step 3" do
    setup do
      put :register, "business" => {}, :user_id => @user.id, :id => @business.id, step: 3
   end
    should assign_to :business
    should redirect_to('step 4') {
      # user_business_register_path(@user, step: 4)
      "/users/#{@user.id}/businesses/#{@user.business.id}/register?step=4"
    }
  end

  context "on get step 4" do
    setup do
      get :edit, :user_id => @user.id, :id => @business.id, :step => '4'
    end
    should respond_with :success
    should render_template :edit
  end

  context "on finishing step 4" do
    setup do
      put :register, business: {}, user_id: @user.id, id: @business.id, step: 4
    end
    should assign_to :business
    should redirect_to('confirm user') {
      user_confirm_path(@user)
    }
  end

end