class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      family_account_path(resource)
    end

end
