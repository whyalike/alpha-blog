class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #Let rails know these are helper methods
  #Make them available for our views
  helper_method :current_user, :logged_in?
  
  def current_user
    # Return user_id if there is a user_id that is stored
    # Then find user
    # return current_user if current user already exists
    #or else, find user_id that is set in the session
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    # To convert to a boolean use !!
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
