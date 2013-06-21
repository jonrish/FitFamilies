require 'spec_helper'

describe ChildAccount do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:gender) }
  it { should validate_presence_of(:date_of_birth) }
  it { should validate_presence_of(:family_account_id) }

  it { should belong_to(:family_account) }
end

