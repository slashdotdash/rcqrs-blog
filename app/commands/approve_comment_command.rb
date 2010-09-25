class ApproveCommentCommand
  extend Commands::ActiveModel
  
  initializer :post_id, :comment_id, :attr_reader => true
  
  validates :post_id, :guid => true
  validates :comment_id, :guid => true
end