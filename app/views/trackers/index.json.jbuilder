json.array!(@trackers) do |tracker|
  json.extract! tracker, :id, :uid, :event, :data, :page
  json.url tracker_url(tracker, format: :json)
end
