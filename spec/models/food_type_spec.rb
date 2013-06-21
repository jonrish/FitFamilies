require 'spec_helper'

describe FoodType do
  it { should validate_presence_of(:food_type) }

  it { should have_many(:foods) }
  it { should have_many(:favorite_foods) }
end
