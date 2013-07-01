class Food < ActiveRecord::Base
	default_scope order('name ASC')

  belongs_to :food_type, 
    :inverse_of => :foods

  validates_presence_of :name
  validates_presence_of :food_type

  attr_accessible :name, :food_type
end
