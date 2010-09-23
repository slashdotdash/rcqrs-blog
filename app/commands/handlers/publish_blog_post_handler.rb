class PublishBlogPostHandler < Commands::Handlers::BaseHandler
  def execute(command)
    post = Post.create(command.title, command.content)
    @repository.save(post)
  end
end