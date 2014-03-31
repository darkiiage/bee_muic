class EventsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @search = Event.upcoming_events.search(params[:q])
    @events = @search.result.paginate(page: params[:page], :per_page => 10)
    @cal_search = Event.search(params[:q])
    @cal_events = @cal_search.result
    @date = params[:month] ? Date.parse(params[:month]) : Date.today

  
  end


  def show
    @event = Event.find(params[:id])
    @comment_items = @event.comments.paginate(page: params[:page])
    @comment =  @event.comments.build 
  end

  def new
    @event = Event.new
    @event.has_locations.build
    @event.has_contacts.build
    @social = @event.has_socials.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.event_image.blank?
      @event_type = EventType.find_by name: @event.event_type
      @event.event_image = @event_type.image;
    end 
    
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

  def edit
    @event = Event.find(params[:id])
    @social_links = @event.has_socials
  end

  def update
    @event = Event.find(params[:id])
    @social_links = @event.has_socials
    if @event.update_attributes(event_params)
      flash[:success] = "Profile updated"
      redirect_to @event
    else
      render 'edit'
    end
  end

  private

    def event_params
      params.require(:event).permit(:event_name, :start_date, :end_date, :event_description, 
                                    :event_cost, :event_guest_type,:event_guest_limit, :event_food,
                                    :event_preregist, :event_type, :event_image,
                                    {:has_locations_attributes => [:id, :location, :floor_number, :room, :description]},
                                    {:has_contacts_attributes => [:id, :contact_name, :contact_email, :contact_phone, :_destroy]},
                                    {:has_socials_attributes => [:id, :social_links, :social_url, :_destroy]} )
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
