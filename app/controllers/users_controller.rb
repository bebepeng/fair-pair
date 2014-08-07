class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to root_path, :notice => "Welcome, #{user.name}!"
    else
      redirect_to new_user_path, :notice => 'User already exists'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end