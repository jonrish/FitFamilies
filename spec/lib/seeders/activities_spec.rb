require 'spec_helper'

describe Seeders::Activities do

	let(:file_path) { File.join(Rails.root, "spec/support/file_fixtures/activities.txt") }
	let(:seeder) { Seeders::Activities }

		it 'seeds an activity with the correct category & description' do
			seeder.seed_with(file_path)
			activity = Activity.last
			category = ActivityCategory.find_by_activity_category("Legs")
			expect(activity.name).to eql('Lunges')
			expect(activity.activity_category).to eql(category)
			expect(activity.description).to eql("major leg muscles")
		end

end
