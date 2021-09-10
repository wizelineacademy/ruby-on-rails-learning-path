require 'utils/constants.rb'

class Api::V1::PlayersController < ApplicationController
  def create
    playerName = generatePlayerName()
    player = Player.create!(:name => playerName, :session_id => session[:session_id])
    render json: player
  end

  def show
  end

  def destroy
  end

  private
  
  def generatePlayerName
    return Constants::ANIMALS.sample
  end
end
