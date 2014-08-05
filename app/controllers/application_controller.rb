class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login(user)
    session[:id] = user.id
  end

  def current_user_id
    session[:id]
  end

  helper_method :logged_in?

  def logged_in?
    !!current_user_id
  end
end
