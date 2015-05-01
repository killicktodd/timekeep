class WatchesController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def index
  	@watches = Watch.all
  end

  def show
  	@watch = Watch.find(params[:id])
  end

  def new
    @watch = Watch.new
  end

  def create
    @watch = Watch.new(watch_params)
    @watch.user = current_user
    if @watch.save 
      flash[:success] = "Thanks for uploading a watch."
      redirect_to @watch
    else
      flash[:error] = "Please check form for errors and try again"
      render :new
    end
  end

  def edit
    @watch = Watch.find(params[:id])
    require_owner(@watch)
  end

  def update
    @watch = Watch.find(params[:id])

    if @watch.update(watch_params)
      flash[:success] = "Update #{@watch.name}"
      redirect_to @watch
    else
      flash[:error] = "Please check form for errors and try again"
      render :edit
    end 
    require_owner(@watch)
  end

  def destroy
    @watch = Watch.find(params[:id])

    flash[:success] = "'#{@watch.name}' was successfully removed" if @watch.destroy 
    redirect_to root_path
    require_owner(@watch)
  end

  private
  
  def watch_params
    params.require(:watch).permit(:name, :description, :price_in_pence, :gender, :style, :brand, :pre_owned, :image)
  end
  

end
