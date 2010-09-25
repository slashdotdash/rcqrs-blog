class PostsController < ApplicationController
  def index
    @posts = PostReport.recent.limit(5)
    
    respond_to do |format|
      format.html
      format.atom
    end
  end
  
  def show
    @post = PostReport.by_slug(params)
    @comments = CommentReport.approved.for(@post)
    @submit_comment_command = SubmitCommentCommand.new(:post_id => @post.guid)
  end
end