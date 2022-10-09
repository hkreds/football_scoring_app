class Public::ScoringsController < ApplicationController
  def new
    @scoring = Scoring.new
    @match = Match.find(params[:match_id])
    @competitors = @match.competitors.all
  end

  def create
    @scoring = Scoring.new(scoring_params)
    if @scoring.save
      flash[:alert] = "登録しました"
      redirect_to scoring_path(@scoring.id)
    else
      flash[:alert] = "正しく入力されていません"
      redirect_to request.referer
    end
  end

  def index
    @scorings = Scoring.page(params[:page])
  end

  def show
    @scoring = Scoring.find(params[:id])
  end

  def edit
    @scoring = Scoring.new
    @match = Match.find(params[:match_id])
    @competitors = @match.competitors.all
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
    params.require(:scoring).permit(:match_id,:customer_id, player_scorings_attributes:
      [:scoring_id,:competitor_id,:score,:review])
  end

end
