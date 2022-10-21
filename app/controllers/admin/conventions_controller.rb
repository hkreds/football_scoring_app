class Admin::ConventionsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @convention = Convention.new
    @conventions = Convention.page(params[:page])
  end
  
  def create
    @convention = Convention.new(convention_params)
    if @convention.save
      redirect_to request.referer
    else
      @conventions = Convention.page(params[:page])
      render :index
    end
  end
  
  def show
    @convention = Convention.find(params[:id])
    @participating_team = ParticipatingTeam.new
    @participating_teams = @convention.participating_teams.all
    @matches = Match.where(convention_id: @convention.id).order(:start_time).page(params[:page])
  end
  
  def edit
    @convention = Convention.find(params[:id])
  end

  def update
    @convention = Convention.find(params[:id])
    if @convention.update(convention_params)
      redirect_to admin_conventions_path
    else
      render :edit
    end
  end
  
  private

  def convention_params
    params.require(:convention).permit(:name,:start_date,:end_date)
  end
  
end