json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :start_datetime, :finished_flg
  json.url meeting_url(meeting, format: :json)
end
