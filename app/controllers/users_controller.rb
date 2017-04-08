class UsersController < ApplicationController
  def show
  	#retrieve user from database
  	@user = User.find(params[:id])
  	#debugger -uncomment to figure out the state of the application; ctrl+D to continue application
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)   # Not the final implementation!
    if @user.save
       log_in @user
       # Handle a successful save.
       flash[:success] = "Welcome to the Sample App!"
       redirect_to @user
    else
      render 'new'
    end
  end

  private
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end

end

