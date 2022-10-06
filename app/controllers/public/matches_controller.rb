class Public::MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
    @competitor = Competitor.new
    @competitors = @match.competitors.all
  end
end
