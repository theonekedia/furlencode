class Store < ActiveRecord::Base
	FACTORY = RGeo::Geographic.simple_mercator_factory
  	set_rgeo_factory_for_column(:coordinates, FACTORY)
	attr_accessor :latitude, :longitude
	validates :name, :presence => true
	after_find :set_lat_long

	def set_lat_long 
		if !self.coordinates.nil?
			@longitude = self.coordinates.x rescue nil
			@latitude = self.coordinates.y rescue nil
		end  
	end
	def self.predictions(keyword)
		self.where("lower(name) like ?", "%#{keyword.to_s.downcase}%")
	end
end
