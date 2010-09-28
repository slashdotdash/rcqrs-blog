class Post
  extend Domain::AggregateRoot
  
  attr_reader :title, :content, :published_at
  attr_reader :comments
  
  def self.create(title, content)
    html_content = GithubMarkdown.to_html(content)
    
    event = BlogPostPublishedEvent.new(
      :guid => Rcqrs::Guid.create, 
      :title => title, 
      :raw_content => content,
      :html_content => html_content,
      :published_at => Time.zone.now)
    create_from_event(event)
  end

  def submit_comment(author, email, website, comment)
    event = CommentSubmittedEvent.new(
      :guid => Rcqrs::Guid.create,
      :post_id => self.guid,
      :post_title => self.title,
      :author => author, 
      :email => email, 
      :website => website,
      :comment => comment)
    apply(event)
  end
  
  def approve_comment(comment_id)
    comment = @comments.detect {|c| c.guid == comment_id }
    raise 'Comment not found' if comment.nil?
    raise 'Comment already approved' if comment.approved?
    
    event = CommentApprovedEvent.new(:comment_id => comment_id, :approved_at => Time.zone.now)
    apply(event)
  end
  
private

  def on_blog_post_published(event)
    @guid, @title, @published_at = event.guid, event.title, event.published_at
    @content = Content.new(event.raw_content, event.html_content)
    @comments = []
  end
  
  def on_comment_submitted(event)
    @comments << Comment.new(event.guid, event.author, event.email, event.website, event.comment)
  end
  
  def on_comment_approved(event)
    comment = @comments.detect {|c| c.guid == event.comment_id }
    comment.approve(event.approved_at)
  end
end