class ApplicationController < ActionController::Base
  # tmp fix for bootstrap integration only: [:registration]
  layout :layout_by_resource

  helper :all
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :get_cms_page, :set_controller_and_action_names

  def current_page
    case [controller_name,controllor_action].join('/')
    when /site\/index/ then :home
    when /radio/ then :radio
    when /events/ then :events
    when /store/ then :store
    when /volunteers/ then :volunteers
    when /contributions/ then :contributions
    end
  end

  private

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def set_controller_and_action_names
    @controller_name = controller_name
    @action_name = action_name
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
    @cms_page ||= if current_reference_string == 'Site: Page'
      CmsPage.find(params[:id])
    else
      CmsPage.get(current_reference_string)
    end
  end

  def record_not_found(e)
    redirect_to root_path, notice: e.message
  end

  def store_location
    session[:return_to] = request.fullpath
  end

   def layout_by_resource
    if devise_controller?
      'registration'
    else
      'application'
    end
  end

  def after_sign_in_path_for(resource)
    user_path resource
  end
end

