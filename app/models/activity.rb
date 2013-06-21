class Activity < ActiveRecord::Base

  validates_presence_of :activity_category_id
  validates_presence_of :description
  validates_presence_of :name

  belongs_to :activity_category,
    :inverse_of => :activities

  attr_accessible :activity_category_id, :description, :name
end
