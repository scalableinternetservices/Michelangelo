json.array!(@unreadlikes) do |unreadlike|
  json.extract! unreadlike, :id, :post_id, :user_id, :liker, :liketype
  json.url unreadlike_url(unreadlike, format: :json)
end
