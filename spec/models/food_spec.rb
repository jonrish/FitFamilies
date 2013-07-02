require 'spec_helper'

describe Food do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:food_type) }

  it { should belong_to(:food_type) }
end
