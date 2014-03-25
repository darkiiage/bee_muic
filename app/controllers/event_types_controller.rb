class EventTypesController < ApplicationController
  def index
  	@event_type = EventType.new;
    @event_type_items = EventType.all;
  end

  def create
  	@event_type = EventType.new(event_type_params)
    if @event_type.save
      flash[:success] = "Event Type created"
      redirect_to event_types_path
    else
      @event_type_items = []
      render 'index'
    end
  end

  def edit
    @event_type = EventType.find(params[:id])
  end

  def update
    @event_type = EventType.find(params[:id])
    if @event_type.update_attributes(event_type_params)
      flash[:success] = "Profile updated"
      redirect_to event_types_path
    else
      render 'edit'
    end
  end

  def destroy
    EventType.find(params[:id]).destroy
    flash[:success] = "Faculty deleted."
    redirect_to event_types_path
  end

  private
  	def event_type_params
      params.require(:event_type).permit(:name,:image, :color)
    end

end
