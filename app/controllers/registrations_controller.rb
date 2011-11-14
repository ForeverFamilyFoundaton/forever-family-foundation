class RegistrationsController < Devise::RegistrationsController
  
  def new
    @user = User.new
    @user.build_address if @user.address.nil?
    3.times { @user.family_members.build } if @user.family_members.empty?
    render '/users/new'
  end

    # POST /resource
  def create
    @user = User.new(params[:user])
    
    if @user.save
      flash[:notice] = I18n.t('flash.user.create.success')
      sign_in(@user)
      url = @user.is_business? ? new_user_business_path(@user) : user_path(@user)
      if session[:adg_registration].present? 
        url = session[:adg_registration]
        session[:adg_registration] = nil
      end
      redirect_to url
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