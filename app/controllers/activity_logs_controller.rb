class ActivityLogsController < ApplicationController
	def index
		@child_account = ChildAccount.find(params[:child_account_id])
		@search = @child_account.activity_logs.search(params[:q])
		@activity_logs = @search.result
	end

	def show
		@activity_log = ActivityLog.find(params[:id])
	end

	def create
		@child_account = ChildAccount.find(params[:child_account_id])
		@activity_log = @child_account.activity_logs.build(params[:activity_log])

		if @activity_log.save
			redirect_to child_account_activity_logs_path(@child_account)
			flash[:notice] = 'The activity has been added to your log'
		else
			redirect_to child_account_favorite_activities_path(@child_account)
			flash[:notice] = 'Something went wrong, the activity was not added to your log'
		end
	end
end


