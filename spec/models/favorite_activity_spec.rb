require 'spec_helper'

describe FavoriteActivity do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:activity_category_id)}
  it { should validate_presence_of(:child_account_id) }

  it { should belong_to(:child_account) }
  it { should belong_to(:activity_category) }
end
