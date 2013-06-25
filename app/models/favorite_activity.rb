class FavoriteActivity < ActiveRecord::Base

  validates_presence_of :activity_category_id
  validates_presence_of :child_account_id
  validates_presence_of :name

  belongs_to :child_account,
    :inverse_of => :favorite_activities
  belongs_to :activity_category,
    :inverse_of => :favorite_activities

  attr_accessible :activity_category_id, :child_account_id, :description, :name, :note, :rating
end
