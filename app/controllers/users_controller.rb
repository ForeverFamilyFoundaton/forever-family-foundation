class UsersController < ApplicationController

  # skip_before_filter :welcome, only: :show
    
  def edit
    @user = current_user
    3.times { @user.family_members.build } if @user.family_members.empty?
    render 'users/edit'    
  end
  
  def update
    @user = current_user
    if @user.update_attributes params[:user]
      redirect_to @user
    else
      @user = current_user
      3.times { @user.family_members.build } if @user.family_members.empty?
      render :edit    
    end
  end
  
  def show
    @user = current_user
    @family_members = current_user.family_members
    @business = current_user.business
  end
  
  # def welcome
  #   current_user.update_attribute :welcomed, true
  # end
  
end





