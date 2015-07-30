json.array!(@comments) do |comment|
  json.extract! comment, :id, :commentable_id, :commentable_type, :body, :user_id
  json.url comment_url(comment, format: :json)
end
