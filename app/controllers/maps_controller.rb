class MapsController < ApplicationController

  def index
  	@maps = Map.all
  	@edit_map = Map.find(1)
  end 

  def edit
  	# @edit_map = Map.find(1)
  end

  def update
  	@edit_map = Map.find(1)
  	if @edit_map.update_attributes(edit_map_params)
      flash[:success] = "Map updated"
      redirect_to maps_path
    else
      render 'edit'
    end
  end
  

  private
  	def edit_map_params
      params.require(:map).permit(:map_image)
    end 
end
