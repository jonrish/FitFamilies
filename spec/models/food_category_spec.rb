require 'spec_helper'

describe FoodCategory do
  it { should validate_presence_of(:food_category) }

  it { should have_many(:foods) }
end
