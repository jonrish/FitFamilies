class FamilyAccountsController < ApplicationController
  def index
    @family_accounts = FamilyAccount.all
  end

  def new
    @family_account = FamilyAccount.new
  end

  def create
    @family_account = FamilyAccount.new(params[:family_account])

    if @family_account.save
      redirect_to @family_account, notice: 'Your account has been created.'
    else
      render action: "new"
    end
  end

  def edit
    @family_account = FamilyAccount.find(params[:id])
  end

  def update
    @family_account = FamilyAccount.find(params[:id])

    if @family_account.update_attributes(params[:family_account])
      redirect_to @family_account, notice: 'Your account has been updated'
    else
      render action: 'edit'
    end
  end

  def show
    @family_account = FamilyAccount.find(params[:id])
  end

  def destroy
    @family_account = FamilyAccount.find(params[:id])
    @family_account.destroy

    redirect_to family_accounts_path, notice: "Your account has been deleted."
  end
end