class LocationsController < ApplicationController
  def index
  	@location = Location.new;
    @location_items = Location.all;
  end

  def create
  	@location = Location.new(location_params)
    if @location.save
      flash[:success] = "New Location created"
      redirect_to locations_path
    else
      @location_items = []
      render 'index'
    end
  end

  def edit
  end

  def update
    @edit_location = Location.find(params[:id])
    if @location.update_attributes(location_params)
      flash[:success] = "Location updated"
      redirect_to locations_path
    else
      render 'edit'
    end
  end

  def destroy
    Location.find(params[:id]).destroy
    flash[:success] = "Location deleted."
    redirect_to locations_path
  end

  private
  	def location_params
      params.require(:location).permit(:map_number, :location_name)
    end

end
