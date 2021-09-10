require 'utils/constants.rb'

class Api::V1::RoomsController < ApplicationController

  def create
    uuid = id_generator()
    while Room.find_by_uuid(uuid)
      uuid = id_generator()
    end
    room = Room.create!(:uuid => uuid)
    render json: room
  end

  def join
    player = getPlayer()
    room = Room.find_by_uuid(params[:uuid])
    if room
      player.room = room
      room.players << player
      player.save
      room.save
      toSend = RoomSerializer.new(room).serializable_hash.to_json;
      logger.info "To Send: #{toSend}"
      render json: toSend
    else
      render json: {error: 'Room not found'}
    end
  end

  def leave
    player = getPlayer()
    if player
      room = Room.find_by_id(player.room.id)
      if room
        room.players.delete(player)
        room.save
      end
    end
  end

  def destroy
  end

  private

  def id_generator(number = 5)
    charset = Array('A'..'Z') + Array(0..9)
    Array.new(number) { charset.sample }.join
  end

  def getPlayer
    player = Player.find_by_session_id(session[:session_id])
    if(!player)
      playerName = generatePlayerName()
      player = Player.new(:name => playerName, :session_id => session[:session_id])
    end
    return player
  end

  def generatePlayerName
    return Constants::ANIMALS.sample
  end
end
