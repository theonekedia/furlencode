class TrackerJob < ActiveJob::Base
  queue_as :tracker

  def perform(*args)
  	track_id = args[0]
    track = Tracker.find(track_id)
    # set input track point
    JSON.parse(track.data).each do |key,value|
    	event = Trackers::Event.new(tracker_id: track_id)
    	event.event_name = key
		event.value = value
		url	= track.page.split('/') - ['http:', 'https:', '']
		event.referrer = url[0]
		event.save!
	end
  end
end
