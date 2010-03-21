class User < ActiveRecord::Base
  include Clearance::User
  has_many :events, :foreign_key => 'speaker_id'
  has_many :comments, :dependent => :destroy
end
