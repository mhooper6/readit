json.array!(@posts) do |post|
  json.extract! post, :id, :title, :link, :score, :user_id, :board_id
  json.url post_url(post, format: :json)
end
