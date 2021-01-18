class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # devise_parameter_sanitizer.permit(追加したいメソッドの種類, keys: [追加したいパラメーター名] 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date])
  end
end
