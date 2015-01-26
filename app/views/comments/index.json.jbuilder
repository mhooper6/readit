json.array!(@comments) do |comment|
  json.extract! comment, :id, :body, :score, :user_id, :post_id
  json.url comment_url(comment, format: :json)
end
