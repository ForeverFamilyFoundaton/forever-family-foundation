class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :get_cms_page
  # before_filter :adg_redirect
  
  def http_auth
    if !session[:authenticated]
      authenticate_or_request_with_http_basic do |username, password|
        username == "fff" && password == "afterlife"
      end
      session[:authenticated] = true
    end
  end

private
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def current_reference_string
    controller = self.controller_name.titleize
    # Admin user should not need to differentiate between edit / update and new / create
    action = case self.action_name
    when 'create' 
      'New'
    when 'update'
      'Edit'
    else
      self.action_name.titleize
    end
    [controller,action, params[:step]].compact.join(": ")
  end
  
  def get_cms_page
    return if request.fullpath =~ /admin/
    @cms_page ||=  if current_reference_string == 'Site: Page'
      CmsPage.find(params[:id])  
    else    
      CmsPage.get(current_reference_string)
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end
  
  # def welcome
  #   if current_user.try :needs_to_be_welcomed?
  #     url = current_user.biz? ? business_wecome_path(current_user) :  users_wecome_path(current_user)
  #     redirect_to url
  #   end
  # end
  
#   def adg_redirect 
#     if session[:adg_registration] && current_user && current_user.welcomed?
#       redirect_to new_adg_registration_path
#     end
#   end
end

