class SessionsController < Devise::SessionsController

  
  def new
  	super
  end

  def create
    super
  end

  private

  
  def after_sign_in_path_for(resource)
    root_path
  end

end
