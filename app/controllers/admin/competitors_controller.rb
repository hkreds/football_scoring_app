class Admin::CompetitorsController < ApplicationController
  def create
    @competitor = Competitor.new(competitor_params)
    if @competitor.save
      redirect_to admin_match_path(@competitor.match_id)
    else
      flash[:alert] = "正しく入力されていません"
      redirect_to admin_match_path(@competitor.match_id)
    end
  end

  def edit
    @competitor = Competitor.find(params[:id])
    @match = @competitor.match
  end

  def update
    @competitor = Competitor.find(params[:id])
    if @competitor.update(competitor_params)
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
    params.require(:competitor).permit(:position,:uniform_number,:team_id,:match_id,:player_id)
  end
end
