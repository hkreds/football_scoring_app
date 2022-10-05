class Admin::AffiliatedPlayersController < ApplicationController
  def create
    @affiliated_player = AffiliatedPlayer.new(affiliated_player_params)
    if @affiliated_player.save
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
    end
  end
  
  def destroy
  end
  
  private

  def affiliated_player_params
    params.require(:affiliated_player).permit(:position,:uniform_number,:team_id,:player_id)
  end
  
end