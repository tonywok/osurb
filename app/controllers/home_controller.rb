class HomeController < ApplicationController
  def index
    @upcoming_events = Event.upcoming
  end

  def show
    render :action => params[:page]
  end 
  
end
