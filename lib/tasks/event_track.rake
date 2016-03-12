namespace :event_track do  
  task :setup => :environment
 
  desc "Trigger Manually tracking population"
  task :track_event => :environment do
    Tracker.all.each do |track|
      employee = Employee.where("lower(website) like ?", "%#{track.url.split(':').first}%")
      track.employee_id = employee.first.id if (employee.length > 0)
      track.save!
      JSON.parse(track.data).each do |key,value|
        event = Trackers::Event.find_or_initialize_by(tracker_id: track.id, event_name: key, value: value)
        event.created_at = track.created_at
        event.save!
        puts 'Automating event ' + track.id.to_s
      end
      puts 'Automating Tracker ' + track.id.to_s
    end
  end
end