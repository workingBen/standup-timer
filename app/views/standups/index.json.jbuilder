json.array!(@standups) do |standup|
  json.extract! standup, :team_id
  json.url standup_url(standup, format: :json)
end
