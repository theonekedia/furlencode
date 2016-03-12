class TrackerJob < ActiveJob::Base
  queue_as :tracker

  def perform(*args)
  	track_id = args[0]
    track = Tracker.find(track_id)
    # set input track point
  end
end
