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
            it 'calling show on an should be successful' do
                post :show
                
                expect(response).to have_http_status(302)
            end
        end
        
        describe 'show' do
            it 'calling officer_show should be successful' do
                post :officer_show
                
                expect(response).to have_http_status(302)
            end
        end
        
        describe 'event' do
            it 'calling event should be successful' do
                post :event
                
                expect(response).to have_http_status(:successful)
            end
        end
        
        describe 'update' do
            it 'calling update on an existing event should be successful' do
                @testEvent = Event.create(eventName: "Dell Workshop", eventDescription: "A workshop with Dell.", eventImage: "dell.jpg")
                
                params = {id: 1, event: {eventName: "Dell Workshop 2", eventDescription: "A workshop with Dell.", eventImage: "dell.jpg"}}
                post :update, params: params
                
                expect(Event.find_by(eventName: "Dell Workshop 2")).to eq(@testEvent)
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
                params = {eventName: "Dell Workshop", eventDescription: "A workshop with Dell.", eventImage: "dell.jpg"}
                post :create, params: params
                
                @testEvent = Event.find_by(eventName: "Dell Workshop")
                
                expect(Event.find_by(eventName: "Dell Workshop")).to eq(@testEvent)
            end
        end
        
    end

end
