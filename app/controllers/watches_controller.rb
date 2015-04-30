class WatchesController < ApplicationController
  def index
  	@watches = Watch.all
  end

  def show
  	@watch = Watch.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
