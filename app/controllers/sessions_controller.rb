class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.name} you are Successfully login"
      redirect_to surveys_path, method: 'get'
    else
      flash[:error] = 'Incorrect user name or password'
      render "new"
    end
  end

  def destroy
    #@user = session[:user_id] = nil
    reset_session
    flash[:notice]= 'Thanx for visiting,you are Logged out successfully'
    redirect_to login_path
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
