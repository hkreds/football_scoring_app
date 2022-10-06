class Public::TeamsController < ApplicationController
  def index
    @teams = Team.page(params[:page])
  end
end
