class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:guest_sign_in]
  before_action :ensure_guest_customer, only: [:edit]
  
  def index
    @customers = Customer.page(params[:page]).per(10)
  end
  
  def show
    @customer = Customer.find(params[:id])
    if params[:newer]
      @scorings = @customer.scorings.newer.page(params[:page]).per(10)
    elsif params[:older]
      @scorings = @customer.scorings.older.page(params[:page]).per(10)
    elsif params[:favorites_count]
      @scorings_favorites = @customer.scorings.favorites_count
      @scorings = Kaminari.paginate_array(@scorings_favorites).page(params[:page]).per(10)
    else
      @scorings = @customer.scorings.newer.page(params[:page]).per(10)
    end
  end
  
  def edit
    @customer = Customer.find(params[:id])
    if @customer.id != current_customer.id
      redirect_to customer_path(@customer.id)
      flash[:alert] = "他の会員の情報は編集できません"
    end
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    else
      render :edit
    end
  end
  
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to customer_path(customer)
    flash[:alert] = "ゲストログインしました。"
  end
  
  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:alert] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  #いいねした投稿一覧
  def favorites
    @customer = Customer.find(params[:id])
    favorites = Favorite.where(customer_id: @customer.id).pluck(:scoring_id)
    @favorite_scorings = Scoring.find(favorites)
  end
  #フォロー・フォロワー機能
  def follows
    @customer = Customer.find(params[:id])
    @customers = @customer.following_customer.page(params[:page]).per(10)
    @following_customers = @customer.following_customer
    @follower_customers = @customer.follower_customer
  end

  def followers
    @customer = Customer.find(params[:id])
    @customers = @customer.follower_customer.page(params[:page]).per(10)
    @following_customers = @customer.following_customer
    @follower_customers = @customer.follower_customer
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image, :email)
  end
  
  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.name == "ゲスト"
      redirect_to customer_path(current_customer) , alert: 'ゲストはプロフィール編集画面へ遷移できません。'
    end
  end
  
end
