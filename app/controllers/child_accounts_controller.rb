class ChildAccountsController < ApplicationController
  def new
    @family_account = FamilyAccount.find(params[:family_account_id])
    @child_account = @family_account.child_accounts.build
  end

  def create
    @family_account = FamilyAccount.find(params[:family_account_id])
    @child_account = @family_account.child_accounts.build(params[:child_account])

    if @child_account.save
      redirect_to family_account_child_account_path(@family_account, @child_account), notice: 'Alright, you\'re in!'
    else
      render action: 'new'
    end
  end

  def update
    @family_account = FamilyAccount.find(params[:family_account_id])
    @child_account = @family_account.child_accounts.find(params[:id])

    if @child_account.update_attributes(params[:child_account])
      redirect_to family_account_child_account_path(@family_account, @child_account), notice: 'Your info has been updated'
    else
      render action: 'edit'
    end
  end

  def show
    @family_account = FamilyAccount.find(params[:family_account_id])
    @child_account = ChildAccount.find(params[:id])
  end

  def edit
    @family_account = FamilyAccount.find(params[:family_account_id])
    @child_account = ChildAccount.find(params[:id])    
  end

  def destroy
    @family_account = FamilyAccount.find(params[:family_account_id])
    @child_account = ChildAccount.find(params[:id])
    @child_account.destroy

    redirect_to family_account_path(@family_account), notice: "Your child's information has been deleted."
  end
end
