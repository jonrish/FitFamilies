class Food < ActiveRecord::Base
  belongs_to :food_type, 
    :inverse_of => :foods

  validates_presence_of :name
  validates_presence_of :food_type

  attr_accessible :name, :food_type
end
