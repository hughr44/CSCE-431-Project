require 'rails_helper'

RSpec.describe UsersEventsController, type: :controller do
    
describe 'Testing UsersEventsController' do
        
        describe 'create' do
            it 'create (register) for an event should be successful' do
                params = {email: 'fake email', eventName: 'fake event'}
                post :create, params: params
                
                @testEvent = UsersEvent.find_by(eventName: 'fake event')
      
                expect(UsersEvent.find_by(eventName: 'fake event')).to eq(@testEvent)
            end
        end
        
        describe 'destroy' do
            it 'calling destroy on an existing event should be successful' do
                params = {email: 'fake email', eventName: 'fake event'}
                post :create, params: params
                
                params = {id: 1}
                post :destroy, params: params
      
                expect(UsersEvent.find_by(eventName: 'fake event')).to eq(nil)
            end
        end
        
    end
end
