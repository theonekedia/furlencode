ActionMailer::Base.default_url_options = {:host => "hobbyst.co"}
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.logger = Logger.new('log/mailer.log')
ActionMailer::Base.default :charset => "utf-8"

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.hobbyst.co",
  :port                 => "587",
  :domain               => 'hobbyst.co',
  :user_name            => ENV["email_user"],
  :password             => ENV["email_password"],
  :authentication       => :login,
  :security_type 		=> 'none',
  :enable_starttls_auto => true ,
  :openssl_verify_mode => 'none' 
}