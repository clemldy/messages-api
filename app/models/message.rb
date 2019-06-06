class Message < ActiveRecord::Base

  belongs_to :room
  belongs_to :user
  validates_presence_of :content, :room_id, :user_id

  after_create_commit { MessageJob.perform_later(self) }

end
