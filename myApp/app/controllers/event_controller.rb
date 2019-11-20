class EventController < ApplicationController
    def event_params
        params.require(:event).permit(:eventID, :eventName, :eventDescription, :eventImage, :eventUsers)
    end
    
    def show
        if (session.has_key?('logged_in'))
            @logged_in_user = getUser(session[:userinfo].fetch("info").fetch("email"))
            @events = Event.all
=begin            
            @data is a container which contains (1) Event object (2) UsersEvents object
            @data should looks like 
            [ 
                [Event obj(Dell Workshop), list of UsersEvent obj, "Register"],
                [Event obj(Industry Night), list of UsersEvent obj, "Unregister"],
                [Event obj(Movie Night), list of UsersEvent obj, "Register"],
            ]
            #populating @data below
=end
            @data = Array.new(@events.size)
            @data.each_index do |i|
                @list_of_users = UsersEvent.where(eventName: @events[i].eventName)
                if(UsersEvent.exists?(eventName: @events[i].eventName, email: @logged_in_user.email))
                    @id = UsersEvent.where(eventName: @events[i].eventName, email: @logged_in_user.email).ids
                    puts @id
                else
                    @id = -1
                end
                @data[i] = [@events[i],@list_of_users, @status]
            end
            return
        end
        
        session['redirect_url'] = '/event'
        redirect_to '/login'
        
        session['logged_in'] = true
    end
    
    def getUser(email)
        return User.where(email: email).first
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
