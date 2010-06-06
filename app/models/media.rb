class Media < ActiveRecord::Base
  belongs_to :album
  has_many :contents
  has_one :user, :through => :album
  
  validates_presence_of :title, :type
end
