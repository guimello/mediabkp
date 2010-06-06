class Content < ActiveRecord::Base
  belongs_to :media
  has_many :tags
  
  validates_presence_of :title
end
