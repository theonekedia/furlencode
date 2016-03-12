class Store < ActiveRecord::Base
	validates :name, :presence => true
	belongs_to :user, class_name: 'User'
	has_many :reviews, class_name: "::Stores::Review"
	def self.predictions(keyword)
		self.where("lower(name) like ?", "%#{keyword.to_s.downcase}%")
	end
end
