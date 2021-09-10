class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.player = Player.find_by_id(params[:player_id])
    message.room = Room.find_by_uuid(params[:room_uuid])
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.body,
        room_uuid: message.room.uuid,
        user: message.player.name
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
