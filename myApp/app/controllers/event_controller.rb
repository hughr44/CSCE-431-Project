class EventController < ApplicationController
    def user_params
        params.require(:event).permit(:eventID, :eventName, :eventDescription, :eventImage, :eventUsers)
    end
    def event 
        @event = Event.all
    end
    
    def create
        Event.create!(:eventID => params['eventID'], :eventName => params['eventName'], :eventDescription => params['eventDescription'], :eventImage => params['eventImage'], :eventUsers => params['eventUsers'])
        redirect_to event_path
    end
end
