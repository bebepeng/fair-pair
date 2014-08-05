class LoginfilterController < ApplicationController
  before_action :is_user_logged_in?

  private

  def is_user_logged_in?
    unless logged_in?
      redirect_to new_sessions_path, notice: "Please sign in to use this feature."
    end
  end
end