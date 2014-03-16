class EventsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @events = Event.search(params[:search])
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
    @event.destroy
    redirect_to root_url
  end


  def new
  	@event = Event.new
  end


  private

    def event_params
      params.require(:event).permit(:event_name)
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
