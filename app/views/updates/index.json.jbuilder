json.array!(@updates) do |update|
  json.extract! update, :user_id, :standup_id, :duration
  json.url update_url(update, format: :json)
end
