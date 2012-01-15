class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
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
end

