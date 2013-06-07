class ChildAccountsController < ApplicationController
  def new
    @family_account = FamilyAccount.find(params[:family_account_id])
    @child_account = @family_account.child_accounts.build
  end

  def create
    @family_account = FamilyAccount.find(params[:family_account_id])
    @child_account = @family_account.child_accounts.build(params[:child_account])

    if @child_account.save
      redirect_to family_account_child_account_path(@family_account, @child_account)
    end
  end

  def show
    @family_account = FamilyAccount.find(params[:family_account_id])
    @child_account = ChildAccount.find(params[:id])
  end
end
