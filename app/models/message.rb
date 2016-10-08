class Message < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  def comments_channel
    "messages:#{id}:comments"
  end

  def publish_comment(str)
    ActionCable.server.broadcast comments_channel, comment: str
  end
end
