class Public::ConventionsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @conventions = Convention.page(params[:page])
  end

  def show
    @convention = Convention.find(params[:id])
    @participating_team = ParticipatingTeam.new
    @participating_teams = @convention.participating_teams.all
    @matches = Match.where(convention_id: @convention.id).order(:start_time).page(params[:page])
  end
end
