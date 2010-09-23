class Post
  extend Domain::AggregateRoot
  
  attr_reader :title, :content

  def self.create(title, content)
    event = BlogPostCreatedEvent.new(:guid => Rcqrs::Guid.create, :title => title, :content => content)
    create_from_event(event)
  end

private

  def on_blog_post_created(event)
    @guid, @title, @content = event.guid, event.title, event.content
  end
end