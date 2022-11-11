class Public::ConventionsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @conventions = Convention.page(params[:page])
  end

  def show
    @convention = Convention.find(params[:id])
    @participating_team = ParticipatingTeam.new
    @participating_teams = ParticipatingTeam.eager_load(:team).where(convention_id: @convention.id)
    @matches = Match.preload(:home_team,:away_team).where(convention_id: @convention.id).order(:start_time).page(params[:page])
  end
end
