class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!
  
  def search
    @range = params[:range]
    if @range == "Customer"
      @customers = Customer.looks(params[:word]).page(params[:page])
    else
      @conventions = Convention.looks(params[:word]).page(params[:page])
    end
  end
  
end
