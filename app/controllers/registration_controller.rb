class RegistrationController < Devise::RegistrationsController
  def new
    @user = User.where(id: params[:id]).first_or_initialize
    @user.build_address if @user.address.nil?
    3.times { @user.family_members.build } if @user.family_members.empty?
    render '/users/new'
  end

  def create
    @user = User.new(params[:user])
    if Rails.env.development?
      verify_recaptcha = true
      logger.debug "---- forcing recaptcha = true -----"
    end
    if verify_recaptcha && @user.save
      flash[:notice] = I18n.t('flash.user.create.success')
      sign_in(@user)
      if @user.is_business?
        redirect_to new_user_business_path(@user)
      else
        redirect_to user_path(@user)
      end
    else
      clean_up_passwords(@user)
      render '/users/new'
    end
  end

  def edit
    @user = current_user
    3.times { @user.family_members.build } if @user.family_members.empty?
    render 'users/edit'
  end

end
