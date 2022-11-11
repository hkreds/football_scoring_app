class Public::MatchesController < ApplicationController
  before_action :authenticate_customer!
  def show
    @match = Match.find(params[:id])
    @competitor = Competitor.new
    @competitors = Competitor.preload(:player).where(match_id: @match.id)
    if params[:newer]
      @scorings = Scoring.preload(:customer,:match).where(match_id: @match.id).newer.page(params[:page]).per(10)
    elsif params[:older]
      @scorings = Scoring.preload(:customer,:match).where(match_id: @match.id).older.page(params[:page]).per(10)
    elsif params[:favorites_count]
      @scorings_favorites = Scoring.preload(:customer,:match).where(match_id: @match.id).favorites_count
      @scorings = Kaminari.paginate_array(@scorings_favorites).page(params[:page]).per(10)
    else
      @scorings = Scoring.preload(:customer,:match).where(match_id: @match.id).newer.page(params[:page]).per(10)
    end
  end
end
