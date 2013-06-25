require 'spec_helper'

describe ActivityLog do
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:activity_category_id) }
	it { should validate_presence_of(:child_account_id) }
	it { should validate_presence_of(:date) }

	it { should belong_to(:activity_category) }
	it { should belong_to(:child_account) }
end
