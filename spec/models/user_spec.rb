require 'spec_helper'

describe User do

  it 'should be able to create an event and act as its speaker' do
    user = Factory.create(:user)
    event = user.events.create
    event.speaker.should == user
  end

  after(:each) do 
    User.delete_all
  end

end
