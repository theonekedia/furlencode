json.array!(@stores) do |store|
  json.extract! store, :id, :name, :coordinates, :rating
  json.url store_url(store, format: :json)
end
