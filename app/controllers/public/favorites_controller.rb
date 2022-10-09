class Public::FavoritesController < ApplicationController
  def create
    @scoring = Scoring.find(params[:scoring_id])
    favorite = current_customer.favorites.new(scoring_id: @scoring.id)
    favorite.save
  end

  def destroy
    @scoring = Scoring.find(params[:scoring_id])
    favorite = current_customer.favorites.find_by(scoring_id: @scoring.id)
    favorite.destroy
  end
end
