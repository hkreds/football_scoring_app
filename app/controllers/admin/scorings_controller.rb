class Admin::ScoringsController < ApplicationController
  before_action :authenticate_admin!
  def index
    if params[:newer]
      @scorings = Scoring.newer.page(params[:page]).per(10)
    elsif params[:older]
      @scorings = Scoring.older.page(params[:page]).per(10)
    elsif params[:favorites_count]
      @scorings_favorites = Scoring.favorites_count
      @scorings = Kaminari.paginate_array(@scorings_favorites).page(params[:page]).per(10)
    elsif params[:unfavorites_count]
      @scorings_unfavorites = Scoring.unfavorites_count
      @scorings = Kaminari.paginate_array(@scorings_unfavorites).page(params[:page]).per(10)
    else
      @scorings = Scoring.newer.page(params[:page]).per(10)
    end
  end

  def show
    @scoring = Scoring.find(params[:id])
    @scoring_comment = ScoringComment.new
  end
  
  def destroy
    @scoring = Scoring.find(params[:id])
    @scoring.destroy
    redirect_to admin_scorings_path
  end
end
