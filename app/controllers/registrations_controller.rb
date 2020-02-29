class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def edit
    resource.build_address if !resource.address
    super
  end

  protected

  def after_update_path_for(resource)
    user_path current_user
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:terms_of_use, :volunteer_policy, :refund_policy, :email_policy]
    devise_parameter_sanitizer.permit(
      :account_update, keys: [
        :first_name,
        :middle_name,
        :last_name,
        :cell_phone,
        :work_phone,
        :home_phone,
        address_attributes: [
          :address,
          :city,
          :state,
          :zip,
          :country
        ]
      ]
    )
  end

  def update_resource(object, attributes)
    update_method = if attributes[:password].present?
      :update_attributes
    else
      attributes.delete :current_password
      :update_without_password
    end
    object.send(update_method, attributes)
  end
end
def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [
        :name, :phone, memberships_attributes: [
          :role, account_attributes: [:name, :terms_accepted]
        ]
      ]
    )
  end
