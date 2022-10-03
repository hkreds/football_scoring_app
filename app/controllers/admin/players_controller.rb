class Admin::PlayersController < ApplicationController
  def index
    @player = Player.new
    @players = Player.page(params[:page])
  end
  
  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to request.referer
    else
      @players = Player.all
      render :index
    end
  end
  
  def show
    @player = Player.find(params[:id])
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
