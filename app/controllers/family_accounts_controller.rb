class FamilyAccountsController < ApplicationController
  before_filter :authenticate_family_account!, :except => [:index]

  def show
    @family_account = current_family_account
  end

end
