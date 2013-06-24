class ActivityLogsController < ApplicationController
	def index
		@child_account = ChildAccount.find(params[:child_account_id])
		@activity_logs = @child_account.activity_logs
	end
end
