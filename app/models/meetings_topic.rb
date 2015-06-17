class MeetingsTopic < ActiveRecord::Base
  belongs_to :meeting_id
  belongs_to :topic_id
end
