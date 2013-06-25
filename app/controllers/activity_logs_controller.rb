class ActivityLogsController < ApplicationController
	def index
		@child_account = ChildAccount.find(params[:child_account_id])
		@search = @child_account.activity_logs.search(params[:q])
		@activity_logs = @search.result
	end

	def show
		@activity_log = ActivityLog.find(params[:id])
	end
end
