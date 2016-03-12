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


employee = Employee.create(username: 'hobbyst', password: '123456')
employee = Employee.create(username: 'theonekedia', password: '123456')
employee = Employee.create(username: 'furlenco', password: '123456')


store = ['Cigrate', "Snacks", "Chai/Coffee", "Petrol", 'Medical shop', 'Hospital']
store.each do |c|
	store = Store.find_or_initialize_by(name: ('Night ' + c))
	if store.new_record?
		store.latitude = 12.9667 + Random.rand(1..1000)
		store.longitude = 77.5667 + Random.rand(1..1000)
		store.rating = Random.rand(100)
		store.user_id = Random.rand(1..10)
		store.category_id = Random.rand(1..6)
		store.save!
	else
		puts "#{store} exists"
	end
end
puts "Finished Stores"