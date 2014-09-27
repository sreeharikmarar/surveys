class RegistrationsController < Devise::RegistrationsController

  def new
  	@user = User.new
  	super
  end
  
  def create

    @user = User.new user_params
    @user.valid?
    
    if @user.save
      redirect_to user_session_path
      flash[:notice] = "You have Successfully Registered with Us.Please verify your mail to get in"
    else
      flash.now[:errors] = @user.errors
      render :new 
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
