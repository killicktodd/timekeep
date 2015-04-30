class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		# Log the user in
  		# Wipe the session clean and then log new user in
  		reset_session
  		session[:user_id] = @user.id
  		flash[:success] = "Thanks for signing up"
  		redirect_to root_path
  	else
  		flash[:error] = "Please check the form for errors and try again"
  		render :new
  	end
  end

  def edit
  end

  private
  def user_params
  	params.require(:user).permit(
  		:first_name, 
  		:last_name, 
  		:password, 
  		:password_confirmation, 
  		:username,
  		:email,
  		:address_line_one,
  		:address_line_two,
  		:address_line_three,
  		:address_line_four,
  		:postcode
  		)
  end
end
