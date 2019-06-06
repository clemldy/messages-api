json.messages do
  json.array! @room.messages.each do |message|
    json.message_id message.id
    json.message_content message.content
    json.message_user_id message.user.id
  end
end
