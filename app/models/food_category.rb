class FoodCategory < ActiveRecord::Base
  has_many :foods

  validates_presence_of :food_category

  attr_accessible :food_category
end
