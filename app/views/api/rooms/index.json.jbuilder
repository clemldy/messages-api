json.array! @rooms do |room|
  json.extract! room, :id, :sender_id, :recipient_id
end
