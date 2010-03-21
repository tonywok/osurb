class CommentsController < ApplicationController

  before_filter :authenticate, :only => [:create, :destroy]

  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.js {}
        format.html {redirect_to events_path(@event) }
      end
    else
      render :action => "new"
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.xml  { head :ok }
    end
  end
 

end

