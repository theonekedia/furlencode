class Stores::Review < ActiveRecord::Base
	belongs_to :store, class_name: '::Store'
	belongs_to :user, class_name: '::User'
end
