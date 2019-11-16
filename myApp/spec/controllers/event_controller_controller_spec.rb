require 'rails_helper'

require_relative '../../app/models/event'
require_relative '../../app/controllers/event_controller'

RSpec.describe EventController, type: :controller do

    describe 'Testing EventController' do
        
        describe 'destroy' do
            before do
                params = {id: 1}
                post :destroy, params: params
            end
            
            it 'calling destroy on an existing event should be successful' do
                expect(EventController.new.destroy).to be_successful
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
            before do
                params = {id: 1}
                post :update, params: params
            end
            
            it 'calling update on an existing event should be successful' do
                expect(EventController.new.update).to be_successful
            end
        end
        
        describe 'edit' do
            before do
                params = {id: 1}
                post :edit, params: params
            end
            
            it 'calling edit on an existing event should be successful' do
                expect(EventController.new.edit).to be_successful
            end
        end
        
        describe 'create' do
            before do
                params = {id: 1}
                post :create, params: params
            end
            
            it 'calling create on an event should be successful' do
                expect(EventController.new.create).to be_successful
            end
        end
        
    end

end
