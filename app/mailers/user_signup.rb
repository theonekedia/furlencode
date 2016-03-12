class UserSignup < ApplicationMailer
  default from: ENV['email_user']
  def signup_mailer id
    @user = User.find(id)
    mail( :to => @user.email,
	    :cc => '', bcc: ENV['email_bcc'], :subject => 'Welcome to Hobbyst' )
  end
end
