class Public::UnfavoritesController < ApplicationController
  def create
    @scoring = Scoring.find(params[:scoring_id])
    unfavorite = current_customer.unfavorites.new(scoring_id: @scoring.id)
    unfavorite.save
  end

  def destroy
    @scoring = Scoring.find(params[:scoring_id])
    unfavorite = current_customer.unfavorites.find_by(scoring_id: @scoring.id)
    unfavorite.destroy
  end
end
