require 'rails_helper'

RSpec.describe AnnouncementController, type: :controller do
    
describe 'Testing AnnouncementController' do
        
        describe 'destroy' do
            it 'first testing proper announcement creation before calling destroy' do
                @testAnn = Announcement.create(announcementTitle: "test anouncement", announcementText: "test test")
                @testAnn = Announcement.find_by(announcementTitle: "test anouncement")
                expect(Announcement.find_by(announcementTitle: "test anouncement")).to eq(@testAnn)
            end
        end
        
        describe 'destroy' do
            it 'calling destroy on an existing announcement should be successful' do
                @testAnn = Announcement.create(announcementTitle: "test anouncement", announcementText: "test test")
                @testAnn = Announcement.find_by(announcementTitle: "test anouncement")
                
                params = {id: 1}
                post :destroy, params: params
                
                expect(Announcement.find_by(announcementTitle: "test anouncement")).to eq(nil)
            end
        end
        
        describe 'update' do
            before do
                params = {id: 1}
                post :update, params: params
                Announcement.create!(:announcementTitle => "test anouncement", :announcementText => "test test")
            end
            
            it 'calling update on an existing announcement should be successful' do
                @testAnn = Announcement.create(:announcementTitle => "test anouncement", :announcementText => "test test")
                
                params = {id: 1}
                post :update, params: params
                
                expect(AnnouncementController.new.update).to be_successful
            end
        end
        
        describe 'edit' do
            it 'calling edit on an existing announcement should be successful' do
                @testAnn = Announcement.create(:announcementTitle => "test anouncement", :announcementText => "test test")
                
                params = {id: 1}
                post :edit, params: params
                
                expect(response).to have_http_status(:success)
            end
        end
        
        describe 'create' do
            it 'calling create on an should be successful' do
                params = {announcementTitle: "test anouncement", announcementText: "test test"}
                post :create, params: params
                
                @testAnn = Announcement.find_by(announcementTitle: "test anouncement")
                
                expect(Announcement.find_by(announcementTitle: "test anouncement")).to eq(@testAnn)
            end
        end
        
        describe 'show' do
            it 'calling show should be successful' do
                post :show
                
                expect(response).to have_http_status(:success)
            end
        end
        
        describe 'officer_show' do
            it 'calling officer_show should be successful' do
                post :officer_show
                
                expect(response).to have_http_status(:success)
            end
        end
        
    end
end
