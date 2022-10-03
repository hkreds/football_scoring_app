class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer)
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image, :email, :is_deleted)
  end
  
end
