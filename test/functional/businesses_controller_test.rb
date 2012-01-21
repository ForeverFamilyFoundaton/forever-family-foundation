require_relative '../test_helper'

class BusinessesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = Factory.create(:user)
    @business = FactoryGirl.create(:business, :user_id => @user.id)
    sign_in @user
  end

  context "on get new" do
    setup do
      get :new, :user_id => @user.id
    end
    should respond_with :success
    should render_template :new
  end

  context "on create business" do
    setup do
      post :create, "business" => FactoryGirl.attributes_for(:business, name: 'Testing Corp')
    end
    should assign_to :business
    should redirect_to("the business step 2 page") {
      business = Business.find_by_name('Testing Corp')
      edit_user_business_path(@user, business, :step => '2')
    }
  end

  context "on business params error" do
    setup do
      post :create, "business" => {}
    end
    should assign_to :business
    should respond_with :success
    should render_template :new
  end

  context "on get edit" do
    setup do
      business = FactoryGirl.create(:business, :user_id => @user.id)
      get :edit, :user_id => @user.id, :id => business.id
    end
    should respond_with :success
    should render_template :edit
  end

  context "on updating user" do
    setup do
      put :update, "business" => FactoryGirl.attributes_for(:business), :id => @business.id, :next_step => '2'
    end
    should assign_to :business
    should redirect_to("the business step 2 page") {
      edit_user_business_path(@user, @business, :step => '2')
    }
  end

  context "on get step 2" do
    setup do
      get :edit, :user_id => @user.id, :id => @business.id, :step => '2'
    end
    should respond_with :success
    should render_template :edit_step_2
  end

  context "on finishing step 2" do
    setup do
      @business.update_attribute :completed_step, 1      
      put :update, "business" => {}, :user_id => @user.id, :id => @business.id, :step => '2'
    end
    should assign_to :business
    should redirect_to("step 3") {
      edit_user_business_path(@user, @business, :step => '3')
    }
  end

  context "on get step 3" do
    setup do
      get :edit, :user_id => @user.id, :id => @business.id, :step => '3'
    end
    should respond_with :success
    should render_template :edit_step_3
  end

  context "on finishing step 3" do
    setup do
      @business.update_attribute :completed_step, 2
      put :update, "business" => {}, :user_id => @user.id, :id => @business.id, step: 3
   end
    should assign_to :business
    should redirect_to("step 4") {
      edit_user_business_path(@user, @business, :step => '4')
    }
  end

  context "on get step 4" do
    setup do
      get :edit, :user_id => @user.id, :id => @business.id, :step => '4'
    end
    should respond_with :success
    should render_template :edit_step_4
  end

  context "on finishing step 4" do
    setup do
      @business.update_attribute :completed_step, 3
      put :update, "business" => {}, :user_id => @user.id, :id => @business.id, step: 4
    end
    should assign_to :business
    should redirect_to("step 5") {
      edit_user_business_path(@user, @business, :step => '5')
    }
  end

  context "on finishing step 5" do
    setup do
      @business.update_attribute :completed_step, 4
      put :update, "business" => {}, :user_id => @user.id, :id => @business.id, step: 5
    end
    should assign_to :business
    should redirect_to("welcome page") {
      businesses_welcome_path(@user)
    }
  end
end