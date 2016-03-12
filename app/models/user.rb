class User < ActiveRecord::Base
  before_create :create_and_update_password
  before_update :update_password
  validates :email, :presence => true, :uniqueness => true#, email: true
  has_many :stores, class_name: 'Store'
  has_many :reviews, class_name: '::Stores::Review'
  after_create :send_mail

  def send_mail
     SignupJob.perform_later(self.id)
  end

  def self.authenticate(email, password)
    @user = User.where('email' => email)
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
