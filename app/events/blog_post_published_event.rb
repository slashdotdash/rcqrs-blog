class BlogPostPublishedEvent < Events::DomainEvent
  initializer :guid, :title, :raw_content, :html_content, :published_at, :attr_reader => true
end