require 'spec_helper'

describe FamilyAccount do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:zip_code) }
  it { should validate_presence_of(:date_of_birth) }

  it { should allow_value('12345').for(:zip_code) }
  it { should_not allow_value('1234').for(:zip_code)}

  it { should_not allow_value("foo").for(:email) }
  it { should allow_value("foo@foo.com").for(:email) }

  it { should have_many(:child_accounts) }
  
end
