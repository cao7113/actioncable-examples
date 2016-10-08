class Comment < ActiveRecord::Base
  belongs_to :message
  belongs_to :user

  #after_commit { CommentRelayJob.perform_later(self) }
  
  after_commit :broadcast_comment
  def broadcast_comment
    str = CommentsController.render(partial: 'comments/comment', locals: { comment: self })
    message.publish_comment(str)
  end
end
