class BlogCreatedEvent < Events::DomainEvent
  initializer :guid, :name, :tagline, :attr_reader => true
end