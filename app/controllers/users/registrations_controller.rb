class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    build_resource(sign_up_params)
    puts sign_up_params
    add_admin_permission_param
    puts sign_up_params
    super
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
    sign_up_params["permission"] = User.permissions["admin"]
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

end
