require 'rails_helper'

RSpec.describe AnnouncementController, type: :controller do
    
describe 'Testing AnnouncementController' do
        
        describe 'destroy' do
            before do
                params = {id: 1}
                post :destroy, params: params
            end
            
            it 'calling destroy on an existing announcement should be successful' do
                expect(AnnouncementController.new.destroy).to be_successful
            end
        end
        
        describe 'update' do
            before do
                params = {id: 1}
                post :update, params: params
            end
            
            it 'calling update on an existing announcement should be successful' do
                expect(AnnouncementController.new.update).to be_successful
            end
        end
        
        describe 'edit' do
            before do
                params = {id: 1}
                post :edit, params: params
            end
            
            it 'calling edit on an existing announcement should be successful' do
                expect(AnnouncementController.new.edit).to be_successful
            end
        end
        
        describe 'create' do
            before do
                params = {id: 1}
                post :create, params: params
            end
            
            it 'calling create on an should be successful' do
                expect(AnnouncementController.new.create).to be_successful
            end
        end
        
        describe 'show' do
            it 'calling show should be successful' do
                expect(AnnouncementController.new.show).to be_successful
            end
        end
        
        describe 'officer_show' do
            it 'calling officer_show should be successful' do
                expect(AnnouncementController.new.officer_show).to be_successful
            end
        end
        
    end
end
