json.array!(@pages_categories) do |pages_category|
  json.extract! pages_category, :id, :page_id, :category_id
  json.url pages_category_url(pages_category, format: :json)
end
