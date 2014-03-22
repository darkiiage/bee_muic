class EventsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @events = Event.search(params[:search])
  end


  def show
    @event = Event.find(params[:id])
    @comment_items = @event.comments.paginate(page: params[:page])
    @comment = @event.comments.build if signed_in?
  end

  def new
    @event = Event.new
    1.times do 
      has_location = @event.has_locations.build
    end 
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to @event
    else
      render 'new'
    end
  end

  def destroy
    @event.destroy
    redirect_to root_url
  end


  private

    def event_params
      params.require(:event).permit(:event_name, :start_date, :end_date, :event_description, 
                                    :event_cost, :event_guest_type,:event_guest_limit, :event_food,
                                    :event_preregist, :event_type, has_locations_attributes: [:location_id, :floor_number, :room, :description] )
    end


    def correct_user
      if current_user.admin
        @event = Event.find(params[:id])
      else
        @event = current_user.events.find_by(id: params[:id])
      end
      redirect_to root_url if @event.nil?
    end

end
