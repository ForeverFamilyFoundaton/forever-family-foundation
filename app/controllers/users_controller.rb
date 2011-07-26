class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = I18n.t('flash.user.create.success')
      redirect_to construct_businesses_or_confirm_path(@user) # written in application controller
    else
      render :action => :new
    end
  end

  def show
  end

  def confirm
    @user = current_user
    if request.post?
      @user.confirm!
      redirect_to user_reg_step_path(@user)
    else
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = I18n.t('flash.user.update.success')
      redirect_to  construct_confirm_or_home_path(@user) # Written in application controller
      #redirect_to url_for(:controller => 'welcome', :action => 'logged_in_index')
    else
      render :action => :edit
    end
  end
end

