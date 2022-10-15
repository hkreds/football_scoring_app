class Public::MatchesController < ApplicationController
  before_action :authenticate_customer!
  def show
    @match = Match.find(params[:id])
    @competitor = Competitor.new
    @competitors = @match.competitors.all
    @scorings = @match.scorings.page(params[:page]).per(10)
  end
end
