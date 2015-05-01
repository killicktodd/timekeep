class OrdersController < ApplicationController
  before_action :require_user, except: [:show]

  def new
  	@order = Order.new
  end

  def create
  	# Find the watch
  	@watch = Watch.find(params[:watch_id])
  	# Create a new order with watch_id = @watch.id
  	@order = @watch.orders.new(order_params)
  	# Set user_id = current_user_id
  	@order.user = current_user
  	# Charging code goes here
  	if @order.save
  		flash[:success] = "Success"
  		redirect_to @order
  	else
  		flash[:error] = "Please check form for errors and try again"
  		render :new
  	end
	end

  def show
  	@order = Order.find(params[:id])
  	require_owner(@order) # Make sure order.user_id == curent_user.id
  end

  private
  def order_params
  	params.require(:order).permit(:stripe_token)
  end

end
