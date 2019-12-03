require 'rails_helper'

require_relative '../../app/models/event'
require_relative '../../app/controllers/event_controller'

RSpec.describe EventController, type: :controller do

    describe 'Testing EventController' do
        
        describe 'destroy' do
            it 'first testing proper event creation before calling destroy' do
                @testEvent = Event.create(eventName: "Dell Workshop", eventDescription: "A workshop with Dell.", eventImage: "dell.jpg")
                @testEvent = Event.find_by(eventName: "Dell Workshop")
                expect(Event.find_by(eventName: "Dell Workshop")).to eq(@testEvent)
            end
        end
        
        describe 'destroy' do
            it 'calling destroy on an existing event should be successful' do
                @testEvent = Event.create(eventName: "Dell Workshop", eventDescription: "A workshop with Dell.", eventImage: "dell.jpg")
                @testEvent = Event.find_by(eventName: "Dell Workshop")
                
                params = {id: 1}
                post :destroy, params: params
                
                expect(Event.find_by(eventName: "Dell Workshop")).to eq(nil)
            end
        end
        
        describe 'show' do
            before do
                params = {id: 1}
                post :show, params: params
            end
            
            it 'calling show on an existing event should be successful' do
                expect(EventController.new.show).to be_successful
            end
        end
        
        describe 'update' do
            it 'calling update on an existing event should be successful' do
                @testEvent = Event.create(eventName: "Dell Workshop", eventDescription: "A workshop with Dell.", eventImage: "dell.jpg")
                
                params = {event: @testEvent, id: 1}
                post :update, params: params
                
                expect(response).to have_http_status(:success)
            end
        end
        
        describe 'edit' do
            it 'calling edit on an existing event should be successful' do
                @testEvent = Event.create(eventName: "Dell Workshop", eventDescription: "A workshop with Dell.", eventImage: "dell.jpg")
                
                params = {id: 1}
                post :edit, params: params
                
                expect(response).to have_http_status(:success)
            end
        end
        
        describe 'create' do
            it 'calling create on an event should be successful' do
                params = {eventID: "eventID", eventName: "eventName", eventDescription: "eventDescription", eventImage: "eventImage", eventUsers: "eventUsers"}
                post :create, params: params
                
                expect(response).to have_http_status(:success)
            end
        end
        
    end

end
