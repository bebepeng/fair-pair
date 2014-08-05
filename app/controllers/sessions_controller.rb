class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      login(user)
      redirect_to root_path, notice: "Welcome back, #{user.name}!"
    else
      redirect_to new_sessions_path, notice: 'Invalid Email/Password Combination'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end