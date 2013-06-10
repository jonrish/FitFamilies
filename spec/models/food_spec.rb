require 'spec_helper'

describe Food do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:food_category_id) }
  it { should validate_presence_of(:food_type_id) }

  it { should belong_to(:food_type) }
  it { should belong_to(:food_category) }
  it { should have_many(:child_accounts).through(:favorite_foods) }
end