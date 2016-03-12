class Tracker < ActiveRecord::Base
	after_create :set_track_points
	has_many :events, class_name: "Trackers::Event"

	def set_track_points
		TrackerJob.perform_later(self.id)
	end
end
