class UsersController < ApplicationController

  def show
  end

  def confirm
    @user = current_user
    if request.post?
      current_user.confirm!
      redirect_to user_reg_step_path
    else
    end
  end

  def edit
    @user = current_user
    @user.build_address if @user.address.nil?
    3.times { @user.family_members.build } if @user.family_members.empty?
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = I18n.t('flash.user.update.success')
      redirect_to  construct_confirm_or_home_path(@user)
    else
      render :action => :edit
    end
  end
end

