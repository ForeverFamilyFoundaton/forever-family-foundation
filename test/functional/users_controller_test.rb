require_relative '../test_helper'

class UsersControllerTest < ActionController::TestCase
  
  context "on get new" do
    setup do
      get :new
    end
    should respond_with :success
    should render_template :new
  end

  context "on create user" do
    setup do
      user_attrs = FactoryGirl.attributes_for(:user)
      user_attrs.merge!(:terms_of_use => "1")
      post :create, "user" => user_attrs
    end
    should assign_to :user
    should respond_with :redirect
  end

  context "on user params error" do
   setup do
     post :create, "user" => FactoryGirl.attributes_for(:user, :password => 'badpass')
   end
   should assign_to :user
   should respond_with :success
   should render_template :new
  end

  context "on get edit" do
   setup do
     @user = Factory.create(:user)
     sign_in @user
     get :edit, :id => @user.id
   end
   should respond_with :success
   should render_template :edit
  end

  context "on updating user" do
   setup do
     @user = Factory.create(:user)
     sign_in @user
     put :update, "user" => FactoryGirl.attributes_for(:user), :id => @user.id
   end
   should assign_to :user
   should respond_with :redirect
  end
  
end
