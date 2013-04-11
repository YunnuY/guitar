class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end 

  # keep user on the same page after signing in
  # def after_sign_in_path_for(resource)
  # 	current_user_path
  # end


  # keep user on the same page after signing out
  def after_sign_out_path_for(resource_or_scope)
  	request.referrer
  end
end
