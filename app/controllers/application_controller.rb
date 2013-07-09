class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  	def find_child
      @child_account = ChildAccount.find(params[:child_account_id])
    end

		def right_kid?
		  if @child_account.family_account != current_family_account
		    redirect_to root_path
		   end
		end

		def authorize
  		if current_family_account.admin 
    		Rack::MiniProfiler.authorize_request
  		end
		end

end
