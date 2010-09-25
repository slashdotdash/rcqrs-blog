class SubmitCommentController < ApplicationController
 def create
    @command = SubmitCommentCommand.new(params[:command])
    if @command.valid?
      publish(@command)
      
      post = PostReport.guid(params[:command][:post_id]).first
      
      flash[:notice] = 'Comment accepted, pending approval'
      redirect_to show_post_url(post)
    else
      render :action => 'new'
    end
  end
end