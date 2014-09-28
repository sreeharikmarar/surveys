class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_user
    if current_user 
      if current_user.is_admin?
        respond_to do |format|
          format.html {redirect_to survey_index_path}
        end
      else
        respond_to do |format|
          format.html {redirect_to dashboard_path}
        end
      end
    end
  end

end
