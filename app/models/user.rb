class User < ActiveRecord::Base
  before_create :create_and_update_password
  before_update :update_password
  validates :email, :presence => true, :uniqueness => true#, email: true

  after_create :send_mail

  def send_mail
    
  end

	protected 
  	####### Update password of user #######
  	def update_password
    	self.password = Password::update(self.password) if self.password_changed?
  	end
  	####### hash password of users after create ######
  	def create_and_update_password
	    # self.roles.push(Role.where(:name => "open_user", :role_type => "U", :parent_id => 1).first_or_create)
	    self.password = SecureRandom.base64(6).gsub(/[$=+\/]/,65.+(rand(25)).chr) if self.password.nil?
	    self.password = Password::update(self.password)
  	end
end
