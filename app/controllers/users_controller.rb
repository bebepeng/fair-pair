class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    login(user)
    redirect_to root_path, :notice => "Welcome, #{user.name}!"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end