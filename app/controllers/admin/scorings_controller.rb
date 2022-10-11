class Admin::ScoringsController < ApplicationController
  def index
    @scorings = Scoring.page(params[:page])
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
