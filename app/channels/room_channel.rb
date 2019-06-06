class RoomChannel < ApplicationCable::Channel

  def subscribed
    if params[:room_id].present?
      stream_from("Room-#{(params[:room_id])}")
    end
  end

  def send_message(data)
    user_id = data['sender_id']
    room_id = data['room_id']
    content = data['content']

    raise 'No Message!' if content.blank?

    Message.create!(
      room_id: room_id,
      user_id: user_id,
      content: content
    )
  end

end
