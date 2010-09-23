class CreateBlogPostCommand
  extend Commands::ActiveModel
  
  initializer :title, :content, :attr_reader => true
  
  validates_presence_of :title, :content
end