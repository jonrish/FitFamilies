require 'spec_helper'

describe FavoriteFood do
  it { should belong_to(:child_account) }
  it { should belong_to(:food) }

  it { should validate_presence_of(:child_account_id) }
  # it { should validate_presence_of(:food_id) }

  subject { FavoriteFood.new(:share_with_others => true, :child_account_id => 1, :food_id => 1) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:food_category) }
  it { should validate_presence_of(:food_type) }
end
