class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @scorings = Scoring.where(customer_id: @customer.id).page(params[:page])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image, :email, :is_deleted)
  end

end
