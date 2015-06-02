class UsersMeeting < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :meeting_id
end
