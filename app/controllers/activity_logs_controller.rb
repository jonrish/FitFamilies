class ActivityLogsController < ApplicationController
	before_filter :authenticate_family_account!
	before_filter :find_child
	before_filter :right_kid?
	before_filter :right_log?, :except => [:new, :create, :index]
	
	def index
		@search = @child_account.activity_logs.search(params[:q])
		@activity_logs = @search.result.page(params[:page]).per(params[:limit] || 15)
	end

	def show
		@activity_log = ActivityLog.find(params[:id])
	end

	def create
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
		@activity_log = ActivityLog.find(params[:id])
		@activity_log.destroy

		redirect_to child_account_activity_logs_path(@child_account)
		flash[:notice] = 'The log entry has been removed'
	end

	protected
    
    def right_log?
      @activity_log = ActivityLog.find(params[:id])
      if @activity_log.child_account != @child_account
        redirect_to root_path
      end
    end

end
