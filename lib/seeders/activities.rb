module Seeders
	module Activities

		def self.seed_with(file_path)
			File.open(file_path, 'r').each_line do |line|
				create_activity(line)
			end
		end

		def self.create_activity(line)
			data = line.gsub!(/~*/,"").split('^')
			Activity.where(name: data[0]).first_or_create do |activity|
				activity_category_name = data[1]
				activity.activity_category = ActivityCategory.find_or_create_by_activity_category(activity_category_name)
				activity.description = data[2]
			end
		end

	end
end
