class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :last_name, :first_name, :last_name_KANA, :first_name_KANA, :birthday])
  end
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'mizu' && password == '0615'
    end
  end
end
