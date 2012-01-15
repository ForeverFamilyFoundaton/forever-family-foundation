class UsersController < ApplicationController

  def show
    @user = current_user
    @family_members = current_user.family_members
    @business = current_user.business    
  end

end

