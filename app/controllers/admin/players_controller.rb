class Admin::PlayersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @player = Player.new
    @players = Player.page(params[:page])
  end
  
  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to request.referer
    else
      @players = Player.page(params[:page])
      render :index
    end
  end
  
  def show
    @player = Player.find(params[:id])
    @affiliated_player = AffiliatedPlayer.new
  end
  
  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to admin_players_path
    else
      render :edit
    end
  end
  
  private

  def player_params
    params.require(:player).permit(:name,:birthday,:height,:weight)
  end
  
end
