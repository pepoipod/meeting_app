class Meeting < ActiveRecord::Base
  has_many :users_meeting
  has_many :user, :through => :users_meeting
end
