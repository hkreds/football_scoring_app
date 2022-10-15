class Admin::MatchesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @match = Match.new
    @matches = Match.page(params[:page])
  end
  
  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to request.referer
    else
      @matches = Match.page(params[:page])
      render :index
    end
  end
  
  def show
    @match = Match.find(params[:id])
    @competitor = Competitor.new
    @competitors = @match.competitors.all
  end
  
  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    if @match.update(match_params)
      redirect_to admin_matches_path
    else
      render :edit
    end
  end
  
  private

  def match_params
    params.require(:match).permit(:name,:convention_id,:home_team_id,:away_team_id,
                                  :start_time,:home_goal,:away_goal)
  end
  
end
