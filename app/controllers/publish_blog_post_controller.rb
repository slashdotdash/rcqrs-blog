class PublishBlogPostController < ApplicationController
  def new
    @command = PublishBlogPostCommand.new
  end
  
  def create
    @command = PublishBlogPostCommand.new(params[:command])
    if @command.valid?
      publish(@command)
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
end