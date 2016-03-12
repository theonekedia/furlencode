json.array!(@users_visits) do |users_visit|
  json.extract! users_visit, :id, :date, :status
  json.url users_visit_url(users_visit, format: :json)
end
