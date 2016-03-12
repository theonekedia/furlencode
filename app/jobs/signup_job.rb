class SignupJob < ActiveJob::Base
  queue_as :signup

  def perform(*args)
  	user_id = args[0]
    UserSignup.signup(user_id).deliver_later
  end
end
