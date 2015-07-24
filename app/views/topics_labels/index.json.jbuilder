json.array!(@topics_labels) do |topics_label|
  json.extract! topics_label, :id, :topic_id, :label_id
  json.url topics_label_url(topics_label, format: :json)
end
