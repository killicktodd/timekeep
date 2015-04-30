class WatchesController < ApplicationController
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
  end

  def update
    @watch = Watch.find(params[:id])
  end

  def destroy
    @watch = Watch.find(params[:id])

    flash[:success] = "'#{@watch.name}' was successfully removed" if @watch.destroy 
    redirect_to root_path
  end

  private
  
  def watch_params
    params.require(:watch).permit(:name, :description, :price_in_pence, :gender, :style, :brand, :pre_owned)
  end
  

end
