class HomeController < ApplicationController
  def index
    @events = Event.approved
    @announcements = Announcement.all
    @listings = @events + @announcements
    @listings = @listings.sort_by { |listing| listing.created_at }.reverse!
  end

  def show
    render :action => params[:page]
  end 
  
end
