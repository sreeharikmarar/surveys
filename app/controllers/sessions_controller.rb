class SessionsController < Devise::SessionsController

  
  def new
  	super
  end

  def create
    super
  end

  private

  
  def after_sign_in_path_for(resource)
    if current_user.is_admin?
      survey_index_path
    else
      dashboard_path
    end
  end

end
