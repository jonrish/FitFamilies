class FamilyAccountsController < ApplicationController
  def new
    @family_account = FamilyAccount.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @familyaccount = FamilyAccount.new(params[:familyaccount])

    respond_to do |format|
      if @familyaccount.save
        format.html { redirect_to @familyaccount, notice: 'Welcome to the Family!' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def show
    @familyaccount = FamilyAccount.find(params[:id])

    respond_to do |format|
      format.html
    end
  end
end