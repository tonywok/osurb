class Announcement < ActiveRecord::Base
  has_many :comments
end
