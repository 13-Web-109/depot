class User < ActiveRecord::Base
  has_one :cart
  has_many :orders
  validates :name, presence: true, uniqueness: true
  has_secure_password
  attr_accessible :name, :password_digest, :password, :password_confirmation, :user_type
  after_destroy :ensure_an_admin_remains

  private
  	def ensure_an_admin_remains
  		if User.count.zero?
  			raise "Can't delete last user"
  		end
  	end
end
