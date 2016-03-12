class Employee < ActiveRecord::Base
  before_create :create_and_update_password
  before_update :update_password
  validates :username, :presence => true, :uniqueness => true#, email: true

  def self.authenticate(email, password)
    @user = Employee.where('username' => email)
    if @user.count == 1 and Password::check(password, @user[0].password)
      @user[0]
    else
      nil
    end
  end

	protected 
  	####### Update password of user #######
  	def update_password
    	self.password = ::Password::update(self.password) if self.password_changed?
  	end
  	####### hash password of users after create ######
  	def create_and_update_password
	    self.password = ::SecureRandom.base64(6).gsub(/[$=+\/]/,65.+(rand(25)).chr) if self.password.nil?
	    self.password = ::Password::update(self.password)
  	end
end
