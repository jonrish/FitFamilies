require 'spec_helper'

describe Activity do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:activity_category_id) }
  it { should validate_presence_of(:description) }

  it { should belong_to(:activity_category) }
end
