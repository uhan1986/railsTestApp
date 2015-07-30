class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, :only => [ :cancel]
  prepend_before_action :authenticate_scope!, :only => [:new, :create ,:edit, :update, :destroy]

  before_action :add_user_sign_up_params, only: [:user_add]

  def new
    super
  end

  def create
    build_resource(sign_up_params)
    add_admin_permission_param
    super
  end


  def user_add
    build_resource(sign_up_params)
    add_admin_permission_param
    super.create

  end

  def build_resource(hash=nil)
    hash[:permission] = User.permissions["admin"]
    super
  end

  protected

  def after_sign_up_path_for(resource)

  end

  private

  def add_admin_permission_param
    if sign_up_params["permission"].nil?
      sign_up_params["permission"] = User.permissions["admin"]
    end
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  def add_user_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email) }
  end
end
