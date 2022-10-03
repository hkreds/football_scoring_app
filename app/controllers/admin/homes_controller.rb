class Admin::HomesController < ApplicationController
  def top
    @customers = Customer.page(params[:page]).per(20)
  end
end