class CommentApprovedEvent < Events::DomainEvent
  initializer :post_id, :comment_id, :approved_at, :approved_comment_count, :attr_reader => true
end