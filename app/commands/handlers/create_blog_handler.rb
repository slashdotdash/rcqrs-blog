class CreateBlogHandler < Commands::Handlers::BaseHandler
  def execute(command)
    blog = Blog.create(command.name, command.tagline)
    @repository.save(blog)
  end
end