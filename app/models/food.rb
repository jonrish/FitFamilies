class Food < ActiveRecord::Base
  belongs_to :food_type, 
    :inverse_of => :foods
  belongs_to :food_category, 
    :inverse_of => :foods

  validates_presence_of :name
  validates_presence_of :food_category_id
  validates_presence_of :food_type_id

  attr_accessible :food_category_id, :name, :food_type_id
end
