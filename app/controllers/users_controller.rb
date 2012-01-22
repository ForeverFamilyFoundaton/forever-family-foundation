class UsersController < ApplicationController

  skip_before_filter :welcome, only: :show
  
  def show
    @user = current_user
    @family_members = current_user.family_members
    @business = current_user.business    
  end
  
  def update
    @user = current_user
    if @user.update_attributes params[:user]
      redirect_to @user
    else
      Rails.logger.debug ">>> #{@user.errors.inspect}"
      @user = current_user
      3.times { @user.family_members.build } if @user.family_members.empty?
      render :edit    
    end
  end

  
end





