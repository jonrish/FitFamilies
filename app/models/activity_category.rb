class ActivityCategory < ActiveRecord::Base

  validates_presence_of :activity_category

  has_many :activities, 
    :inverse_of => :activity_category
  has_many :favorite_activities,
    :inverse_of => :activity_category
  has_many :activity_logs,
  	:inverse_of => :activity_category

  attr_accessible :activity_category
end
