json.array!(@topics) do |topic|
  json.extract! topic, :id, :title, :body, :user_id, :finished_flg, :page_id
  json.url topic_url(topic, format: :json)
end
