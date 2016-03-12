json.array!(@trackers_events) do |trackers_event|
  json.extract! trackers_event, :id, :tracker_id, :event_name, :value, :referrer
  json.url trackers_event_url(trackers_event, format: :json)
end
