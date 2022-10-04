class Public::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).per(10)
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    else
      render :edit
    end
  end
  
  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  #フォロー・フォロワー機能
  def follows
    @customer = Customer.find(params[:id])
    @customers = @user.following_customer.all
    @following_customers = @user.following_customer
    @follower_customers = @user.follower_customer
  end

  def followers
    @customer = Customer.find(params[:id])
    @customers = @user.follower_customer.all
    @following_customers = @customer.following_customer
    @follower_customers = @customer.follower_customer
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image, :email)
  end
  
end
