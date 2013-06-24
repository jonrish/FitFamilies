require 'spec_helper'

describe ChildAccount do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:gender) }
  it { should validate_presence_of(:date_of_birth) }
  it { should validate_presence_of(:family_account_id) }

  it { should belong_to(:family_account) }
  it { should have_many(:favorite_foods) }
  it { should have_many(:favorite_activities) }
  it { should have_many(:activity_logs) }
end
