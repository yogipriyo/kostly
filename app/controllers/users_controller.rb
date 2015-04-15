class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: 'User created!'
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end
    if @user.update(user_params)
      redirect_to users_path, notice: 'User has been updated!'
    else
      render :edit
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, notice: 'User has been deleted!'
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
