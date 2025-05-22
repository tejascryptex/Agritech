class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
  def require_login
    unless current_user
      redirect_to session_path, alert: "Please log in to access this page."
    end
  end
  allow_browser versions: :modern
end
