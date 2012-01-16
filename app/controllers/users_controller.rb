class UsersController < ApplicationController

  before_filter :welcome, only: :show
  
  def show
    @user = current_user
    @family_members = current_user.family_members
    @business = current_user.business    
  end

  def welcome
    current_user.update_attribute :welcomed, true
  end
end

