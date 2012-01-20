class BusinessesController < ApplicationController

  def new
    @business = Business.new
  end

  def create
    @business = current_user.build_business(params[:business].merge(completed_step: 1))
    if @business.save
      flash[:notice] = I18n.t('flash.business.create.success', step: 1)
      redirect_to edit_user_business_path(current_user, @business, step: 2)
    else
      render :action => :new
    end
  end

  def edit
    @business = current_user.business
    step = params[:step] || '1'
    render :template => "businesses/edit_step_#{step}"
  end

  def update
    @business = current_user.business
    if @business.update_attributes(params[:business])
      @business.complete_step!
      flash[:notice] = I18n.t('flash.business.reg_step_complete', step: params[:step])
      if @business.reg_complete?
        redirect_to businesses_welcome_path(current_user)
      else
        redirect_to edit_user_business_path(current_user, @business, :step => @business.next_step)
      end
    else
      render :template => "businesses/edit_step_#{@business.next_step}}"
    end
  end

  def attachment
    attached_file = current_user.business.attached_files.find(params[:attachment_id])
    send_file attached_file.attachment.path, :type => attached_file.attachment.content_type
  end

  def welcome
    current_user.update_attribute :welcomed, true
  end
end

