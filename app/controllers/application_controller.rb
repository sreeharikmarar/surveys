class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def require_user
  #   if user_signed_in?
  # 	  respond_to do |format|
  # 		format.html {redirect_to dashboard_path}
  # 	  end
  #   end
  # end
end
