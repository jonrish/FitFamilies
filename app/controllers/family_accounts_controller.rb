class FamilyAccountsController < ApplicationController
  before_filter :authenticate_family_account!, :except => [:index]

  # def index
  # end

  # def new
  #   @family_account = FamilyAccount.new
  # end

  # def create
  #   @family_account = FamilyAccount.new(params[:family_account])
  # end

  # def edit
  #   @family_account = FamilyAccount.find(params[:id])
  # end

  # # def update
  # #   @family_account = FamilyAccount.find(params[:id])
  # # end

  def show
    @family_account = FamilyAccount.find(params[:id])
  end

  # def destroy
  #   @family_account = FamilyAccount.find(params[:id])
  #   @family_account.destroy

  #   redirect_to family_accounts_path, notice: "Your account has been deleted."
  # end
end
