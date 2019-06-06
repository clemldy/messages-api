
class MessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    payload = {
      room_id: message.room.id,
      content: message.content,
      user_id: message.user.id
    }
    ActionCable.server.broadcast(build_room_id(message.room.id), payload)
  end

  def build_room_id(id)
    "Room-#{id}"
  end

end
