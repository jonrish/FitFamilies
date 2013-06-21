require 'spec_helper'

describe ActivityCategory do
  it { should validate_presence_of(:activity_category) }

  it { should have_many(:activities) }
end
