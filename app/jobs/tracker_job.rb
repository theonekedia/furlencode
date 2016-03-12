class TrackerJob < ActiveJob::Base
  queue_as :tracker

  def perform(*args)
  	track_id = args[0]
    track = Tracker.find(track_id)
    # set input track point
    if track
      employee = Employee.where("lower(website) like ?", "%#{track.url.split(':').first}%")
      track.employee_id = employee.first.id if (employee.length > 0)
      track.save!
      JSON.parse(track.data).each do |key,value|
        event = Trackers::Event.new(tracker_id: track.id)
        event.event_name = key
        event.value = value
        event.created_at = track.created_at
        event.save!
        puts 'Processing event ' + track_id.to_s
      end
      puts 'Processing Tracker ' + track_id.to_s
    end
  end
end
