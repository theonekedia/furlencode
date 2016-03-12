class Tracker < ActiveRecord::Base
	after_create :set_track_points

	def set_track_points
		TrackerJob.perform_later(self.id)
	end
end
