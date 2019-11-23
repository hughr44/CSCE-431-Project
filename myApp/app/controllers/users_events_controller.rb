class UsersEventsController < ApplicationController
    def destroy
        @usersEvent = UsersEvent.find(params[:id])
        @usersEvent.destroy
        redirect_to "/event/"
    end
    
    def create
        UsersEvent.create!(:email => params[:email], :eventName => params[:eventName])
        redirect_to "/event/"
    end
end
