class FavoriteFood < ActiveRecord::Base
  belongs_to :child_account
  belongs_to :food

  validates_presence_of :child_account_id
  # validates_presence_of :food_id

  validates_presence_of :name,
    :if => :sharing?
  validates_presence_of :food_type, 
    :if => :sharing?
  validates_presence_of :food_category, 
    :if => :sharing?

  def sharing?
    share_with_others == true
  end

  attr_accessible :child_account_id, :food_category, :food_id, :food_type, :name, :note, :rating, :share_with_others
end
