class FoodType < ActiveRecord::Base
  has_many :foods, :inverse_of => :food_type
  has_many :favorite_foods, :inverse_of => :food_type

  validates_presence_of :food_type

  attr_accessible :food_type
end
