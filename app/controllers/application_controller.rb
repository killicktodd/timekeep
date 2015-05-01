class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
  	if logged_in?
  		User.find(session[:user_id])
  	end
  end

  def logged_in?
  	session[:user_id].present?
  end

  def require_user
    unless logged_in? 
      flash[:error] = "You must be logged in to do that"
      redirect_to new_session_path
    end
  end

  def require_owner(resource)
    unless logged_in? and current_user.owns(resource)
      flash[:error] = "You must own the #{resource.class.to_s.downcase} to do that"
      redirect_to root_path
      
    end
  end

end
