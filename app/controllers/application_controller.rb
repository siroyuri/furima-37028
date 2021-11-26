class ApplicationController < ActionController::Base
  before_action :configure_parmitted_parameters, if: :devise_controller?
  before_action :basic_auth

  def configure_parmitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday]
    )
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["FURIMA_BASIC_AUTH_USER"] && password == ENV["FURIMA_BASIC_AUTH_PASSWORD"]
    end
  end
end
