json.array!(@friendships) do |friendship|
  json.extract! friendship, :id, :friender_id, :friended_id, :accepted, :created_at, :updated_at
  json.url friendship_url(friendship, format: :json)
end
