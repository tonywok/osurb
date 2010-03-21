class Event < ActiveRecord::Base
  belongs_to :speaker, :foreign_key => 'speaker_id', :class_name => 'User'
  has_many :comments, :dependent => :destroy
  validates_presence_of :what, :when, :where, :description
  
  named_scope :approved, :conditions => {:approved => true}
  named_scope :unapproved, :conditions => {:approved => false}

  def self.upcoming
    @events = []
    Event.approved.each do |event|
      @events << event if event.when >= Date.today
    end
    @events
  end

  def self.past
    @events = []
    Event.approved.each do |event|
      @events << event if event.when < Date.today
    end
    @events
  end

  def approve
    self.update_attribute(:approved, true)
    if self.when < Date.today
      self.update_attribute(:when, nil)
    end
  end

  def unapprove
    self.update_attribute(:approved, false)
  end

end
