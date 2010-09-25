class ApproveCommentHandler < Commands::Handlers::BaseHandler
  def execute(command)
    post = @repository.find(command.post_id)
    post.approve_comment(command.comment_id)
    
    @repository.save(post)
  end
end