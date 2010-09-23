class Blog
  extend Domain::AggregateRoot
  
  attr_reader :name, :tagline

  def self.create(name, tagline)
    event = BlogCreatedEvent.new(:guid => Rcqrs::Guid.create, :name => name, :tagline => tagline)
    create_from_event(event)
  end

private

  def on_blog_created(event)
    @guid, @name, @tagline = event.guid, event.name, event.tagline
  end
end