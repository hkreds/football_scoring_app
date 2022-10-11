class Admin::ScoringCommentsController < ApplicationController
  def destroy
    ScoringComment.find(params[:id]).destroy
    redirect_to request.referer
  end
end
