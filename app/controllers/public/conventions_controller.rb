class Public::ConventionsController < ApplicationController
  def index
    @conventions = Convention.page(params[:page])
  end
end
