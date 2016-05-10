class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_action :set_locale

  def after_sign_in_path_for(resource)
    "/dashboard"
  end

  def after_update_path_for(resource)
    "/dashboard"
  end

  private
  	def set_locale
	  	I18n.locale = params[:locale] || I18n.default_locale
	  end
  
	  def default_url_options(options = {})
		  { locale: I18n.locale }.merge options
		end
  
	  def require_admin_login
		  unless (user_signed_in? and current_user.is_admin)
			  redirect_to :dashboard
		  end
	  end
end
