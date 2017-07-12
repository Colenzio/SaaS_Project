class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # If the user is submitting a form through the deivse controller, run action
  before_action :configure_permitted_parameters, if: :devise_controller?
  
protected
  def configure_permitted_parameters
    # Whitelist these parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:stripe_card_token, :email, :password, :password_confirmation) }
  end
end
