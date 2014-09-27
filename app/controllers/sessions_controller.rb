class SessionsController < Devise::SessionsController

  def new
  	super
  end

  def create
  	user = params['user']
    @user = user && user['email'] ? User.find_by_email(user['email']) : nil
    
    @user.valid?
    flash[:error] = "You have not confirmed your email address" if !@user.confirmed?
    if flash[:error] || @user.errors.any? 
      self.resource = @user
      redirect_to user_session_url
      return false
    else
      # redirect_to dashboard_path
      super
    end
  end
end
