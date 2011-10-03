class BusinessesController < ApplicationController

  def new
    @business = Business.new
  end

  def create
    @business = current_user.build_business(params[:business].merge(completed_step: 1))
    if @business.save
      current_user.business_registered!
      flash[:notice] = I18n.t('flash.business.create.success')
      redirect_to edit_user_business_path(current_user, @business, :step => '2')
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
    next_step = params[:next_step]
    @business.completed_step = @business.completed_step.to_i + 1 if @business.completed_step.to_i < 4
    if @business.update_attributes(params[:business])
      flash[:notice] = I18n.t('flash.business.update.success')
      if next_step.blank?
        redirect_to construct_confirm_or_home_path(current_user)
      else
        redirect_to edit_user_business_path(current_user, @business, :step => next_step)
      end
    else
      render :template => "businesses/edit_step_#{get_current_step(next_step)}"
    end
  end

  def attachment
    attached_file = current_user.business.attached_files.find(params[:attachment_id])
    send_file attached_file.attachment.path, :type => attached_file.attachment.content_type
  end

  private

  def get_current_step(next_step)
    return '3' if next_step.blank?
    return ( next_step.to_i - 1 )
  end
end

