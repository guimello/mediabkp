class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable, :trackable
  devise :registerable, :authenticatable, :recoverable,
         :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :username
  
  has_many :albums
  
  validates_presence_of :username
  validates_uniqueness_of :username, :email
  
  def self.find_for_authentication(conditions = {})    
    conditions = ["username LIKE ? or email LIKE ?", conditions[:email], conditions[:email]]
    #raise StandardError, conditions.inspect
    super
  end
end
