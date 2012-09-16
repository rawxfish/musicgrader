class PiecesController < ApplicationController
  def create
    @piece = current_user.pieces.create (params[:piece])
    
    redirect_to current_user
  end
end
