class EventsController < ApplicationController
  def new
  	@event = Event.new
  end

  def create
  	@event = current_user.events.build(event_params)
  	if @event.save
  		flash[:success] = "Event created!"
  		redirect_to current_user
  	else
  		flash.now[:error] = "Event not created"
  		render 'new'
  	end
  end

  def index
  	@events_past = Event.past
    @events_future = Event.future
  end
end

 private
  
def event_params
	params.require(:event).permit(:title, :description, :date, :location)
end