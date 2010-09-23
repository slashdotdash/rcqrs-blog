class CreateBlogPostController < ApplicationController
  def new
    @command = CreateBlogPostCommand.new
  end
  
  def create
    @command = CreateBlogPostCommand.new(params[:command])
    if @command.valid?
      publish(@command)
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
end