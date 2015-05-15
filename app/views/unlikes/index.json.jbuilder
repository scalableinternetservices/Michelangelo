json.array!(@unlikes) do |unlike|
  json.extract! unlike, :id, :post_id, :user_id
  json.url unlike_url(unlike, format: :json)
end
