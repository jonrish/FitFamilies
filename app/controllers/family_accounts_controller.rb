class FamilyAccountsController < ApplicationController
  before_filter :authenticate_family_account!, :except => [:index]

  def show
    @family_account = FamilyAccount.find(params[:id])
  end

end
