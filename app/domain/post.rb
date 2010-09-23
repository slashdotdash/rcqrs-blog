class Post
  extend Domain::AggregateRoot
  
  attr_reader :title, :content, :published_at

  def self.create(title, content)
    event = BlogPostPublishedEvent.new(
      :guid => Rcqrs::Guid.create, 
      :title => title, 
      :content => content, 
      :published_at => Time.now)
    create_from_event(event)
  end

private

  def on_blog_post_published(event)
    @guid, @title, @content, @published_at = event.guid, event.title, event.content, event.published_at
  end
end