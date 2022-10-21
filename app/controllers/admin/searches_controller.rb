class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
  def search
    @range = params[:range]
    if @range == "Player"
      @players = Player.looks(params[:word]).page(params[:page])
    elsif @range == "Team"
      @teams = Team.looks(params[:word]).page(params[:page])
    elsif @range == "Convention"
      @conventions = Convention.looks(params[:word]).page(params[:page])
    elsif @range == "Match"
      @matches = Match.looks(params[:word]).page(params[:page])
    elsif @range == "Customer"
      @customers = Customer.looks(params[:word]).page(params[:page]).per(10)
    end
  end
end
