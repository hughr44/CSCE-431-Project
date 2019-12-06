class EventController < ApplicationController
    def event_params
        params.require(:event).permit(:eventID, :eventName, :eventDescription, :eventImage, :eventUsers)
    end
    
    def show
        if (session.has_key?('logged_in'))
            @logged_in_user = getUser(session[:userinfo].fetch("info").fetch("email"))
            
            if (@logged_in_user == nil)
                redirect_to '/'
                return
            end
            
            @events = Event.all
            @usersEvents = UsersEvent.all
            
            @eventNameToListOfUsers = Hash.new
            @eventNameToIfCurrentUserRegistered = Hash.new
            @eventNameToUsersEventsObj = Hash.new
            @eventNameToEventObj = Hash.new
            @events.each do |e|
                @eventNameToListOfUsers[e.eventName] = UsersEvent.where(eventName: e.eventName)
                @eventNameToIfCurrentUserRegistered[e.eventName] = UsersEvent.exists?(eventName: e.eventName, email: @logged_in_user.email)
                @eventNameToUsersEventsObj[e.eventName] = UsersEvent.where(eventName: e.eventName, email: @logged_in_user.email)
                @eventNameToEventObj[e.eventName] = e
            end
        else
            session['redirect_url'] = '/event'
            redirect_to '/login'
            session['logged_in'] = true
        end
    end
    
    def officer_show
        if (session.has_key?('logged_in'))
            @logged_in_user = getUser(session[:userinfo].fetch("info").fetch("email"))
            @events = Event.all
            @usersEvents = UsersEvent.all
            
            if (@logged_in_user == nil)
                redirect_to '/'
                return
            end
            
            # @eventNameToListOfUsers = Hash.new
            # @eventNameToIfCurrentUserRegistered = Hash.new
            # @eventNameToUsersEventsObj = Hash.new
            # @eventNameToEventObj = Hash.new
            # @events.each do |e|
            #     @eventNameToListOfUsers[e.eventName] = UsersEvent.where(eventName: e.eventName)
            #     @eventNameToIfCurrentUserRegistered[e.eventName] = UsersEvent.exists?(eventName: e.eventName, email: @logged_in_user.email)
            #     @eventNameToUsersEventsObj[e.eventName] = UsersEvent.where(eventName: e.eventName, email: @logged_in_user.email)
            #     @eventNameToEventObj[e.eventName] = e
            # end
        else
            session['redirect_url'] = '/event'
            redirect_to '/login'
            session['logged_in'] = true
        end
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
        Event.create!(:eventName => params['eventName'], :eventDescription => params['eventDescription'], :eventImage => params['eventImage'])
        redirect_to '/officer/event'
    end
    
    def edit
        @event = Event.find(params[:id])
    end
    def update
        @event = Event.find(params[:id])
        @event.update_attributes!(event_params)
        redirect_to '/officer/event'
    end
    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to '/officer/event'
    end
    #TODO list 
    #add eventDate
    #take out id
    #know what permissionLevel user has
    #make eventUsers an array
end
