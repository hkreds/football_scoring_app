class Admin::TeamsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @team = Team.new
    @teams = Team.page(params[:page])
  end
  
  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to request.referer
    else
      @teams = Team.page(params[:page])
      render :index
    end
  end
  
  def show
    @team = Team.find(params[:id])
    @affiliated_player = AffiliatedPlayer.new
    @affiliated_players = @team.affiliated_players.all
  end
  
  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to admin_teams_path
    else
      render :edit
    end
  end
  
  private

  def team_params
    params.require(:team).permit(:name,:abbreviation,:manager,:team_image)
  end
  
end
