class BusinessesController < ApplicationController
  before_filter :continue_registration, only: [:new]
  
  def new
    params[:step] ||= 1
    @business = current_user.business || Business.new
  end

  def create
    @business = current_user.build_business(params[:business])
    if @business.save
      @business.complete_step!(1)
      flash[:notice] = I18n.t('flash.business.create.success', step: 1)
      redirect_to user_business_register_path(current_user, @business, step: 2)
    else
      render template: "businesses/new"
    end
  end

  def register
    params[:step] ||= session[:step]
    session[:step] = params[:step]
    
    @user = current_user
    @business = current_user.business
    if request.put?
      if @business.update_attributes(params[:business])
        @business.complete_step!(params[:step])
        if @business.reg_complete?
          redirect_to user_confirm_path(@user) and return
        end
        flash[:notice] = I18n.t('flash.business.create.success', step: params[:step])
        redirect_to user_business_register_path(current_user, step: params[:step].to_i + 1)
      else
        render template: "businesses/register"
      end
    else
      render template: "businesses/register"
    end
  end

  def edit
    @business = current_user.business
  end

  def update
    @business = current_user.business
    if @business.update_attributes(params[:business])
      flash[:notice] = I18n.t('flash.business.update.success')
      redirect_to user_path(current_user)
    else
      render template: "businesses/edit"
    end
  end

  def attachment
    attached_file = current_user.business.attached_files.find(params[:attachment_id])
    send_file attached_file.attachment.path, :type => attached_file.attachment.content_type
  end

  def welcome
    current_user.update_attribute :welcomed, true
    current_user.business.update_attribute :welcomed, true if current_user.biz?
  end

private

  def continue_registration
    if session[:step].present?
      redirect_to user_business_register_path(current_user, current_user.business, step: session[:step]) 
    end
  end
end