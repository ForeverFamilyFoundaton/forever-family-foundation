class RegistrationsController < Devise::RegistrationsController
  
  def new
    @user = User.new
    @user.build_address if @user.address.nil?
    3.times { @user.family_members.build } if @user.family_members.empty?
  end

    # POST /resource
  def create
    @user = User.new(params[:user])
    
    if @user.save
      flash[:notice] = I18n.t('flash.user.create.success')
      sign_in(@user)
      url = @user.is_business? ? new_user_business_path(@user) : user_confirm_path(@user)
      redirect_to url
    else
      clean_up_passwords(@user)
      render :action => :new
    end
  end
end