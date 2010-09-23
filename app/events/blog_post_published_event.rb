class BlogPostPublishedEvent < Events::DomainEvent
  initializer :guid, :title, :content, :published_at, :attr_reader => true
end