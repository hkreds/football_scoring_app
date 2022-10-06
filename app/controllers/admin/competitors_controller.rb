class Admin::CompetitorsController < ApplicationController
  def create
    @competitor = Competitor.new(competitor_params)
    if @competitor.save
      redirect_to admin_match_path(@competitor.match_id)
    end
  end
  
  def edit
    @competitor = Competitor.find(params[:id])
  end
  
  def update
    @competitor = Competitor.find(params[:id])
    if @competitor.update(competitor_player_params)
      redirect_to admin_match_path(@competitor.match_id)
    end
  end
  
  def destroy
    @competitor = Competitor.find(params[:id])
    @competitor.destroy
    redirect_to admin_match_path(@competitor.match_id)
  end
  
  private

  def competitor_params
    params.require(:competitor).permit(:position,:match_id,:player_id)
  end
end
