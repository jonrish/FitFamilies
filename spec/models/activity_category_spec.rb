require 'spec_helper'

describe ActivityCategory do
  it { should validate_presence_of(:activity_category) }

  it { should have_many(:activities) }
  it { should have_many(:favorite_activities) }
  it { should have_many(:activity_logs) }
end
