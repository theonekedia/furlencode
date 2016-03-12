class Trackers::Event < ActiveRecord::Base
	belongs_to :tracker, class_name: '::Tracker'
end
