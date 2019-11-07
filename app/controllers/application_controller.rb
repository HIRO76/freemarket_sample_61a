class ApplicationController < ActionController::Base
  
  before_action :basic_auth, :set_categories

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "43543"
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :profile, :image,])
  end

  def set_categories
    @categories = Category.where(parent_id: 0)
  end

end
