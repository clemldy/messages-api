class RoomChannel < ApplicationCable::Channel

  def subscribed
    if params[:room_id].present?
      stream_from("Room-#{(params[:room_id])}")
    end
  end

  def send_message(data)
    room = Room.find(data['room_id'])
    if room.present?
      room.messages.create!(user_id: data['sender_id'], content: data['content'])
    end
  end

end
