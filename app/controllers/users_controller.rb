class UsersController < ApplicationController

  skip_before_filter :welcome, only: :show
  
  def show
    @user = current_user
    @family_members = current_user.family_members
    @business = current_user.business    
  end

end

