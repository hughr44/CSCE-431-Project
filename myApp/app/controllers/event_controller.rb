class EventController < ApplicationController
    def event_params
        params.require(:event).permit(:eventID, :eventName, :eventDescription, :eventImage, :eventUsers)
    end
    
    def new 
       @event = Event.new 
    end
    def event 
        @event = Event.all
    end
    
    def create
        #TODO eventID counter
        # if(session[:user].permissionLevel=='admin')
            Event.create!(:eventID => params['eventID'], :eventName => params['eventName'], :eventDescription => params['eventDescription'], :eventImage => params['eventImage'], :eventUsers => params['eventUsers'])
        # end    
        redirect_to event_path
    end
    
    def show
        @event = Event.find(params[:id])
        # redirect_to user
    end
    
    def edit
        #TODO
    end
    #TODO add eventDate
end
