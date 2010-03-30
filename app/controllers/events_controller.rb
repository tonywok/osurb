class EventsController < ApplicationController
  
  before_filter :authenticate, :except => [:index, :show]
  before_filter :authenticate_admin, :only => [:approve, :unapprove]  
  before_filter :speaker_or_admin, :only => [:edit, :update, :destroy]

  def index
    @events = Event.approved
  end
  
  def show
    @event = Event.find(params[:id])
    @comments = @event.comments
    @comment = @event.comments.new
  end
  
  def new
    @event = current_user.events.new
  end
  
  def create
    @event = current_user.events.new(params[:event])
    if @event.save
      flash[:notice] = "Successfully created event."
      redirect_to @event
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated event."
      redirect_to @event
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Successfully destroyed event."
    redirect_to events_url
  end

  def approve
    @event = Event.find(params[:id])
    @event.approve
    flash[:notice] = "Successfully approved event."
    redirect_to events_url
  end

  def unapprove
    @event = Event.find(params[:id])
    @event.unapprove
    flash[:notice] = "Successfully unapproved event."
    redirect_to events_url
  end

  private 

  def speaker_or_admin
    @event = Event.find(params[:id])
    deny_access unless (current_user == @event.speaker || current_user.admin?)
  end

end
