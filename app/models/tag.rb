class Tag < ActiveRecord::Base
  belongs_to :content
  
  validates_presence_of :category
end
