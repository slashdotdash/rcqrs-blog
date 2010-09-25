class CommentSubmittedEvent < Events::DomainEvent
  initializer :guid, :post_id, :post_title, :author, :email, :website, :comment, :attr_reader => true
end