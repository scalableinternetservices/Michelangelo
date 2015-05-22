json.array!(@unreadcomments) do |unreadcomment|
  json.extract! unreadcomment, :id, :comment_id, :post_id, :user_id
  json.url unreadcomment_url(unreadcomment, format: :json)
end
