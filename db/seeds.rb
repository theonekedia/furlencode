# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
category = ['Cigrate', "Snacks", "Chai/Coffee", "Petrol", 'Medical shop', 'Hospital']
category.each do |c|
	category = Category.find_or_initialize_by(name: c)
	if category.new_record?
		category.save!
	else
		puts "#{category} exists"
	end
end
puts "Finished Category"
