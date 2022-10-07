class Public::ScoringsController < ApplicationController
  def new
    @scoring = Scoring.new
    @match = Match.find(params[:match_id])
    @competitors = @match.competitors.all
  end
  
  def create
    @scoring = Scoring.new(scoring_params)
    @scoring.save
    redirect_to scoring_path(@scoring.id)
  end

  def edit
    @scoring = Scoring.find(params[:id])
    @match = @competitor.match
  end

  def update
    @scoring = Scoring.find(params[:id])
    if @scoring.update(scoring_params)
      redirect_to match_path(@scoring.id)
    end
  end

  def destroy
    @scoring = Scoring.find(params[:id])
    @scoring.destroy
    redirect_to match_path(@scoring.match_id)
  end

  private

  def scoring_params
    params.require(:scoring).permit(:match_id,:competitor_id)
  end
end
