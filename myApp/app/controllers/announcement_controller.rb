class AnnouncementController < ApplicationController
    def announcement_params
        params.require(:announcement).permit(:announcementTitle, :announcementText)
    end
    def show
        @announcements = Announcement.all
    end
    
    def officer_show
        @announcements = Announcement.all
    end
    
    def edit
        @announcement = Announcement.find(params[:id])
    end
    
    def create
        Announcement.create!(:announcementTitle => params[:announcementTitle], :announcementText => params[:announcementText])
        redirect_to '/officer/announcement'
    end
    
    def destroy
        @announcement = Announcement.find(params[:id])
        @announcement.destroy
        redirect_to '/officer/announcement'
    end
    
    def update
        @announcement = Announcement.find(params[:id])
        @announcement.update_attributes!(announcement_params)
        redirect_to '/officer/announcement'
    end
end
