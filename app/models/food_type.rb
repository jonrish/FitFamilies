class FoodType < ActiveRecord::Base
  has_many :foods

  validates_presence_of :food_type

  attr_accessible :food_type
end
