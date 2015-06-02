json.array!(@users_meetings) do |users_meeting|
  json.extract! users_meeting, :id, :user_id_id, :meeting_id_id
  json.url users_meeting_url(users_meeting, format: :json)
end
