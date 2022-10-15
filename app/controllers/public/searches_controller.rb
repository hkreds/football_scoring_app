class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]
    if @range == "Customer"
      @customers = Customer.looks(params[:word]).page(params[:page]).per(10)
    elsif @range == "Team"
      @teams = Team.looks(params[:word]).page(params[:page])
    elsif @range == "Convention"
      @conventions = Convention.looks(params[:word]).page(params[:page])
    elsif @range == "Match"
      @matches = Match.looks(params[:word]).page(params[:page])
    end
  end

end
