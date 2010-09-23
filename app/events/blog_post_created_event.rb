class BlogPostCreatedEvent < Events::DomainEvent
  initializer :guid, :attr_reader => true
end