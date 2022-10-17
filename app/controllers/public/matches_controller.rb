class Public::MatchesController < ApplicationController
  before_action :authenticate_customer!
  def show
    @match = Match.find(params[:id])
    @competitor = Competitor.new
    @competitors = @match.competitors.all
    if params[:newer]
      @scorings = @match.scorings.newer.page(params[:page]).per(10)
    elsif params[:older]
      @scorings = @match.scorings.older.page(params[:page]).per(10)
    elsif params[:favorites_count]
      @scorings_favorites = @match.scorings.favorites_count
      @scorings = Kaminari.paginate_array(@scorings_favorites).page(params[:page]).per(10)
    else
      @scorings = @match.scorings.newer.page(params[:page]).per(10)
    end
  end
end
