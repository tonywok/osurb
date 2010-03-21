require File.dirname(__FILE__) + '/../spec_helper'
 
describe EventsController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Event.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Event.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Event.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(event_url(assigns[:event]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Event.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Event.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Event.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Event.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Event.first
    response.should redirect_to(event_url(assigns[:event]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    event = Event.first
    delete :destroy, :id => event
    response.should redirect_to(events_url)
    Event.exists?(event.id).should be_false
  end
end
