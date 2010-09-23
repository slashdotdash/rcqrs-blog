class CreateBlogCommand
  extend Commands::ActiveModel
  
  initializer :name, :tagline, :attr_reader => true
  
  validates_presence_of :name, :tagline
end