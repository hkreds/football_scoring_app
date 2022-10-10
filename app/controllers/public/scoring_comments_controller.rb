class Public::ScoringCommentsController < ApplicationController
  def create
    @scoring = Scoring.find(params[:scoring_id])
    @scoring_comment = ScoringComment.new
    comment = current_customer.scoring_comments.new(scoring_comment_params)
    comment.scoring_id = @scoring.id
    comment.save
  end

  def destroy
    @scoring = Scoring.find(params[:scoring_id])
    @scoring_comment = ScoringComment.new
    @comment = ScoringComment.find_by(id: params[:id], scoring_id: params[:scoring_id]).destroy
  end
  
  private
  
  def scoring_comment_params
    params.require(:scoring_comment).permit(:comment)
  end
  
end
