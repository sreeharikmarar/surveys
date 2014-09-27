class SessionsController < Devise::SessionsController

  def new
  	super
  end

  def create
  	user = params['user']
    @user = user && user['email'] ? User.find_by_email(user['email']) : nil

    if flash[:error] || (@user && @user.errors.any?)
      
      self.resource = @user
      redirect_to user_session_url
      return false
    else
      super
    end
  end
end
