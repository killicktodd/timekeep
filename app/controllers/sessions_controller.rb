class SessionsController < ApplicationController
  def new
  	# Dont need to assign anything not saving anything to DB
  end

  def create
  	# Log in functionality goes here
  	email = params[:session][:email]
  	password = params[:session][:password]

  	@user=User.find_by(email: email)
  	if @user.present? and @user.authenticate(password)
  		# Wipe the session clean
  		reset_session
  		# Log in
  		session[:user_id] = @user.id
  		flash[:success] = "Logged in."
  		redirect_to root_path
  	else
  		flash[:error] = "Try again"
  		render :new
  	end
  end

  def show
  end


  def destroy
  	reset_session
  	flash[:success] = "Logged out. See you again soon"
  	redirect_to root_path
  end
end
