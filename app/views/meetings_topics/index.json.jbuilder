json.array!(@meetings_topics) do |meetings_topic|
  json.extract! meetings_topic, :id, :meeting_id_id, :topic_id_id
  json.url meetings_topic_url(meetings_topic, format: :json)
end
