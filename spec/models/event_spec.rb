require 'spec_helper'

describe Event do
  describe 'getting hold of certain events' do

    it 'should be able to find events that have happened already' do
      event = Factory.create(:event, :when => Date.yesterday, :approved => true)
      Event.past.length.should == 1
    end

    it 'should be able to find events that have not yet occurred' do
      event = Factory.create(:event, :when => Date.tomorrow.tomorrow, :approved => true)
      Event.upcoming.length.should == 1
    end

    it 'should be able to find events that have been approved' do
      event = Factory.create(:event, :approved => true)
      Event.approved.length.should == 1
    end 

    it 'should be able to find events that have yet to be approved' do 
      event = Factory.create(:event, :approved => false)
      Event.unapproved.length.should == 1
    end
  end

  describe 'events being cool to others' do

    it 'should make when nil if approved after when passes' do
      event = Factory.create(:event, :when => Date.yesterday)
      event.approve
      event.when.nil?.should == true
    end

    it 'should be able to unapprove an approved event' do
      event = Factory.create(:event, :approved => true)
      event.unapprove
      event.approved.should == false 
    end

  end

  after(:all) do
    Event.delete_all
  end
end
