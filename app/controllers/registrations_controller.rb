class RegistrationsController < Devise::RegistrationsController
  def wait; end

  protected

  def after_inactive_sign_up_path_for(resource)
    registrations_wait_path
  end
end
