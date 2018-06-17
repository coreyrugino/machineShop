class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    # binding.pry
    render file: "public/blocked", layout: false, status: 404, formats: [:html]
    # render file: "public/404", layout: false, status: 404, formats: [:html]
    # redirect_to root_path, :method => :get, :alert => exception.message
  end
# protected
  # def configure_devise_permitted_parameters
  #   registration_params = [:first_name, :last_name, :email, :encrypted_password]
    # binding.pry

  #   if params[:action] == 'create'
  #     devise_parameter_sanitizer.for(:sign_up) do
  #       |u| u.permit(registration_params)
  #     end
  #   end
  # end

  protected

  def configure_permitted_parameters
    # binding.pry
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
