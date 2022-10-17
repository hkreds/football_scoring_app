class Public::ScoringsController < ApplicationController
  before_action :authenticate_customer!
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
      flash[:alert] = "正しく入力されていません。寸評が100文字を超えているか、既に同じ試合で採点を行っている可能性があります。"
      redirect_to request.referer
    end
  end

  def index
    if params[:newer]
      @scorings = Scoring.newer.page(params[:page]).per(10)
    elsif params[:older]
      @scorings = Scoring.older.page(params[:page]).per(10)
    elsif params[:favorites_count]
      @scorings_favorites = Scoring.favorites_count
      @scorings = Kaminari.paginate_array(@scorings_favorites).page(params[:page]).per(10)
    else
      @scorings = Scoring.newer.page(params[:page]).per(10)
    end
  end

  def show
    @scoring = Scoring.find(params[:id])
    @scoring_comment = ScoringComment.new
  end

  def edit
    @scoring = Scoring.find(params[:id])
  end

  def update
    @scoring = Scoring.find(params[:id])
    if @scoring.update(scoring_params)
      flash[:alert] = "更新しました"
      redirect_to scoring_path(@scoring.id)
    else
      flash[:alert] = "正しく入力されていません"
      redirect_to request.referer
    end
  end

  def destroy
    @scoring = Scoring.find(params[:id])
    @scoring.destroy
    @scoring.player_scorings.destroy_all
    redirect_to match_path(@scoring.match_id)
  end

  private

  def scoring_params
    params.require(:scoring).permit(:match_id,:customer_id, player_scorings_attributes:
      [:scoring_id,:competitor_id,:score,:review,:id])
  end

end
