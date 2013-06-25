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

	def edit
		@activity_log = ActivityLog.find(params[:id])
	end

	def update
		@activity_log = ActivityLog.find(params[:id])

		if @activity_log.update_attributes(params[:activity_log])
			redirect_to child_account_activity_logs_path(@activity_log.child_account)
			flash[:notice] = 'Your activity log entry has been updated'
		else
			render action: 'edit'
		end
	end

	def destroy
		@child_account = ChildAccount.find(params[:child_account_id])
		@activity_log = ActivityLog.find(params[:id])
		@activity_log.destroy

		redirect_to child_account_activity_logs_path(@child_account)
		flash[:notice] = 'The log entry has been removed'
	end

end


