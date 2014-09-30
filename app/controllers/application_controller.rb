class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin
    unless current_user && current_user.is_admin?
      flash[:notice] = "You dont have permission to Access this page"
      redirect_to root_url and return false
    end
  end

end
