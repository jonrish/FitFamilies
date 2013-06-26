class ActivityLog < ActiveRecord::Base

	validates_presence_of :activity_category_id
	validates_presence_of :child_account_id
	validates_presence_of :name
	validates_presence_of :date

	belongs_to :child_account,
		:inverse_of => :activity_logs
	belongs_to :activity_category,
		:inverse_of => :activity_logs

  attr_accessible :activity_category_id, :child_account_id, :description, :name, :note, :rating, :repetitions, :sets, :time, :weight, :date
end
