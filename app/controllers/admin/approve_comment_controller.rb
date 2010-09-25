module Admin
  class ApproveCommentController < AdminController
    def create
      @command = ApproveCommentCommand.new(params[:command])
      if @command.valid?
        publish(@command)
        
        flash[:notice] = "Comment approved"
      else
        flash[:warning] = "Failed to approve comment. #{@command.errors.full_messages.join(',')}"
      end
      redirect_to admin_comments_path
    end
  end
end