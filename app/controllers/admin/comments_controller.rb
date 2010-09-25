module Admin
  class CommentsController < AdminController
    def index
      @pending = CommentReport.pending
    end
  end
end