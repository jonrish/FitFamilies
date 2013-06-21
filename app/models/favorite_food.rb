class FavoriteFood < ActiveRecord::Base
  belongs_to :child_account, :inverse_of => :favorite_foods
  belongs_to :food_category, :inverse_of => :favorite_foods
  belongs_to :food_type, :inverse_of => :favorite_foods

  validates_presence_of :child_account_id
  validates_presence_of :name
  validates_presence_of :food_type_id
  validates_presence_of :food_category_id

  attr_accessible :child_account_id, :food_category_id, :food_type_id, :name, :note, :rating, :share_with_others
end
