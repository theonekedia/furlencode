$redis = Redis.new(:host => ENV['redis_host'], :port => ENV['redis_port'])
Resque.redis = $redis
Resque.after_fork = Proc.new { 
	ActiveRecord::Base.establish_connection 
}
