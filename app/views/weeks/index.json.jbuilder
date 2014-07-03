json.array!(@weeks) do |week|
  json.extract! week, :id, :first
  json.url week_url(week, format: :json)
end
