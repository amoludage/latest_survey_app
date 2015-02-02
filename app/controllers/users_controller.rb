class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User is saved successfully'
      redirect_to users_path
    else
      #@user.errors.get_full_message[:password]
      flash[:error] = 'Something wrong in user details'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = 'User details updates successfully'
      redirect_to users_path
    else
      flash[:error] = 'Someyhing wrong user not deleted'
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'User successfully deleted'
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :email, :gender, :age)
  end

end
