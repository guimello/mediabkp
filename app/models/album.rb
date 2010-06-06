class Album < ActiveRecord::Base
  belongs_to :user
  has_many :medias
  has_many :contents, :through => :medias
  
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :user_id
end
