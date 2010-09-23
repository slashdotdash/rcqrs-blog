class BlogPostPublishedEvent < Events::DomainEvent
  initializer :guid, :title, :content, :attr_reader => true
end