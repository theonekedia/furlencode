# Preview all emails at http://localhost:3000/rails/mailers/user_signup
class UserSignupPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_signup/signup
  def signup
    UserSignup.signup
  end

end
