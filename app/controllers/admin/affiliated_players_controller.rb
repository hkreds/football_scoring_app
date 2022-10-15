class Admin::AffiliatedPlayersController < ApplicationController
  before_action :authenticate_admin!
  def create
    @affiliated_player = AffiliatedPlayer.new(affiliated_player_params)
    if @affiliated_player.save
      flash[:alert] = "選手を登録しました"
      redirect_to admin_team_path(@affiliated_player.team_id)
    else
      flash[:alert] = "正しく入力されていません"
      redirect_to admin_team_path(@affiliated_player.team_id)
    end
  end
  
  def edit
    @affiliated_player = AffiliatedPlayer.find(params[:id])
  end
  
  def update
    @affiliated_player = AffiliatedPlayer.find(params[:id])
    if @affiliated_player.update(affiliated_player_params)
      redirect_to admin_team_path(@affiliated_player.team_id)
    else
      render :edit
    end
  end
  
  def destroy
    @affiliated_player = AffiliatedPlayer.find(params[:id])
    @affiliated_player.destroy
    redirect_to admin_team_path(@affiliated_player.team_id)
  end
  
  private

  def affiliated_player_params
    params.require(:affiliated_player).permit(:position,:uniform_number,:team_id,:player_id)
  end
  
end
