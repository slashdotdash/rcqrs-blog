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
  end
end