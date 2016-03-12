class ApplicationMailer < ActionMailer::Base
  default from: ENV["email_user"]
  layout 'mailer'
end
