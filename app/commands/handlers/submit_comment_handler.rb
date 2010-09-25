class SubmitCommentHandler < Commands::Handlers::BaseHandler
  def execute(command)
    post = @repository.find(command.post_id)
    post.submit_comment(command.author, command.email, command.website, command.comment)
  end
end