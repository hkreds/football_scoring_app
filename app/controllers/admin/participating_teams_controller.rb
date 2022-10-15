class Admin::ParticipatingTeamsController < ApplicationController
  before_action :authenticate_admin!
  def create
    @participating_team = ParticipatingTeam.new(participating_team_params)
    if @participating_team.save
      redirect_to admin_convention_path(@participating_team.convention_id)
    else
      flash[:alert] = "登録済みのチームです"
      redirect_to admin_convention_path(@participating_team.convention_id)
    end
  end
  
  def edit
    @participating_team = ParticipatingTeam.find(params[:id])
    @convention = @participating_team.convention
  end
  
  def update
    @participating_team = ParticipatingTeam.find(params[:id])
    if @participating_team.update(participating_team_params)
      redirect_to admin_convention_path(@participating_team.convention_id)
    else
      @convention = @participating_team.convention
      render :edit
    end
  end
  
  def destroy
    @participating_team = ParticipatingTeam.find(params[:id])
    @participating_team.destroy
    redirect_to admin_convention_path(@participating_team.convention_id)
  end
  
  private

  def participating_team_params
    params.require(:participating_team).permit(:convention_id,:team_id)
  end
  
end
