class WatchesController < ApplicationController
  def index
  	@watches = [{name: "Backup Black", description: "Backup Black Lorem ipsum", price_in_pence: 50000},
  				{name: "Classic Digital Casio", description: "Casio Lorem ipsum", price_in_pence: 4999},
  				{name: "1960s Vintage Raketa", description: "1960s Lorem ipsum", price_in_pence: 12000},
  				{name: "Max Bill Chronoscope", description: "Max Bill Lorem ipsum", price_in_pence: 200000}
  				]
  end

  def show
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
