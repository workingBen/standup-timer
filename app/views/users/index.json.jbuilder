json.array!(@users) do |user|
  json.extract! user, :name, :team_id
  json.url user_url(user, format: :json)
end
