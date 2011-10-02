# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # helper_method :current_user_session, :current_user, :is_admin?
  before_filter :get_cms_page
  before_filter :http_auth unless ['development','test'].include?(Rails.env)

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

    def get_cms_page
      return if request.fullpath =~ /admin/
      
      controller = self.controller_name.titleize
      # Admin user should not need to differentiate between edit / update and new / create
      action = case self.action_name
      when "create"
        "New"
      when "update"
        "Edit"
      else
        self.action_name.titleize
      end
      @cms_page = CmsPage.get([controller,action].join(": "))
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def store_location_adg_registration
      session[:adg_registration] = request.fullpath
    end

    # def redirect_back_or_default(default)
    #    redirect_to(session[:return_to] || default)
    #    session[:return_to] = nil
    #  end
 
    def construct_businesses_or_confirm_path(user)
      (user.state == 'initial_reg' and user.is_business) ? new_user_business_path(user) :  user_confirm_path(user)
    end

    def construct_confirm_or_home_path(user)
      (user.state == 'confirm') ? (url_for(:controller => 'welcome', :action => 'logged_in_index')) : user_confirm_path(current_user)
    end

    def user_reg_step_path(user)
      if user.state == 'initial_reg' and user.is_business
        return new_user_business_path(user)
      else
        if session[:adg_registration]
          return_path = session[:adg_registration]
          session[:adg_registration] = nil
          return return_path
        else
          return url_for(:controller => 'welcome', :action => 'logged_in_index')
        end
      end
    end
end

