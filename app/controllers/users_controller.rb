class UsersController < ApplicationController

  protect_from_forgery only: :schema

  def schema
    Hash[User.new.attributes.keys.map {|k| [k,k]}]
    respond_to {|format| format.json { render json: User.new.attributes.keys } }
  end

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
      @user = current_user
      3.times { @user.family_members.build } if @user.family_members.empty?
      render 'users/edit'
    end
  end

  # def confirm
  #   @user = current_user
  #   @business = current_user.business if @user.biz?
  #   if request.put?
  #     session[:step] = nil
  #     current_user.update_attribute :confirmed, true
  #     if current_user.biz?
  #       current_user.business.update_attribute :confirmed, true
  #       redirect_to businesses_welcome_path(current_user)
  #     else
  #       redirect_to users_welcome_path(current_user)
  #     end
  #   end
  # end

  # def welcome
  #   current_user.update_attribute :welcomed, true
  # end

  def edit_password
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      # Sign in the user by passing validation in case his password changed
      flash[:notice] = 'Password updated!'
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit_password"
    end
  end

end





