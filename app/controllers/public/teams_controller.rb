class Public::TeamsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @teams = Team.page(params[:page])
  end
  
  def show
    @team = Team.find(params[:id])
    @affiliated_player = AffiliatedPlayer.new
    @affiliated_players = @team.affiliated_players.all
  end
  
end
