class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def authenticate_user!
    redirect_to new_sessions_path, notice: "Please sign in" unless user_signed_in?
  end
  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?
  def current_user
    @current_user ||= User.find_by_id session[:user]
  end
  helper_method :current_user
end
