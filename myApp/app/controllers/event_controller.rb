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
        #TODO idk why event.params doesn't work
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
        @event = Event.find(params[:id])
    end
    def update
        @event = Event.find(params[:id])
        @event.update_attributes!(event_params)
        redirect_to event_path
    end
    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to event_path
    end
    #TODO list 
    #add eventDate
    #take out id
    #know what permissionLevel user has
    #make eventUsers an array
end
