class Admin::CompetitorsController < ApplicationController
  before_action :authenticate_admin!
  def create
    @competitor = Competitor.new(competitor_params)
    if @competitor.save
      flash[:alert] = "出場選手を登録しました"
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
      flash[:alert] = "出場選手の情報を更新しました"
      redirect_to admin_match_path(@competitor.match_id)
    else
      @match = @competitor.match
      render :edit
    end
  end

  def destroy
    @competitor = Competitor.find(params[:id])
    @competitor.destroy
    flash[:alert] = "出場選手を削除しました"
    redirect_to admin_match_path(@competitor.match_id)
  end

  private

  def competitor_params
    params.require(:competitor).permit(:position,:uniform_number,:team_id,:match_id,:player_id)
  end
end
