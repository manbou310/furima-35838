class ApplicationController < ActionController::Base
  before_action :basic_auth
  #↓devise_controllerの処理であれば実行
  before_action :configure_permitted_parameters, if: :devise_controller?


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'masa' && password == '8310'
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname ,:last_name_zenkaku ,:first_name_zenkaku ,:last_name_kana ,:first_name_kana ,:birth_day])
  end
end

