require_relative '../test_helper'

class BusinessesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  context "on get new" do
    setup do
      @user = Factory.create(:user)
      sign_in @user
      get :new, :user_id => @user.id
    end
    should respond_with :success
    should render_template :new
  end

  context "on create business" do
    setup do
      @user = Factory.create(:user)
      sign_in @user
      post :create, "business" => FactoryGirl.attributes_for(:business)
    end
    should assign_to :business
    should redirect_to("the business step 2 page") {
      business = Business.find_by_name('New Tech')
      edit_user_business_path(@user, business, :step => '2') 
    }  
  end

  context "on business params error" do
    setup do
      sign_in Factory.create(:user)
      post :create, "business" => {}
    end
    should assign_to :business
    should respond_with :success
    should render_template :new
  end

  context "on get edit" do
    setup do
      @user = Factory.create(:user)
      sign_in @user
      business = FactoryGirl.create(:business, :user_id => @user.id)
      get :edit, :user_id => @user.id, :id => business.id
    end
    should respond_with :success
    should render_template :edit_step_1
  end

  context "on updating user" do
    setup do

      @user = Factory.create(:user)
      sign_in @user
      @business = FactoryGirl.create(:business, :user_id => @user.id)
      put :update, "business" => FactoryGirl.attributes_for(:business), :id => @business.id, :next_step => '2'
    end
    should assign_to :business
    should redirect_to("the business step 2 page") {
      edit_user_business_path(@user, @business, :step => '2') 
    }
  end

  context "on get step 2" do
    setup do

      @user = Factory.create(:user)
      sign_in @user
      @business = FactoryGirl.create(:business, :user_id => @user.id)
      get :edit, :user_id => @user.id, :id => @business.id, :step => '2'
    end
    should respond_with :success
    should render_template :edit_step_2
  end

  context "on finishing step 2" do
    setup do

      @user = Factory.create(:user)
      sign_in @user
      @business = FactoryGirl.create(:business, :user_id => @user.id)
      put :update, "business" => FactoryGirl.attributes_for(:business_step_2), :user_id => @user.id, :id => @business.id, :next_step => '3'
    end
    should assign_to :business
    should redirect_to("the business step 3 page") {
      edit_user_business_path(@user, @business, :step => '3') 
    }
  end

  context "on get step 3" do
    setup do

      @user = Factory.create(:user)
      sign_in @user
      @business = FactoryGirl.create(:business, :user_id => @user.id)
      get :edit, :user_id => @user.id, :id => @business.id, :step => '3'
    end
    should respond_with :success
    should render_template :edit_step_3
  end

  context "on finishing step 3" do
    setup do

      @user = Factory.create(:user)
      sign_in @user
      @business = FactoryGirl.create(:business, :user_id => @user.id)
      put :update, "business" => FactoryGirl.attributes_for(:business_step_3), :user_id => @user.id, :id => @business.id
    end
    should assign_to :business
    should redirect_to("the confirmation page") {
      user_confirm_path(@user)
    }
  end

end
