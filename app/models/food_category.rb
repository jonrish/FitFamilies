class FoodCategory < ActiveRecord::Base
  has_many :favorite_foods, 
    :inverse_of => :food_category

  validates_presence_of :food_category

  attr_accessible :food_category
end
