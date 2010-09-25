module Admin
  class CreateBlogController < AdminController
    skip_before_filter :find_blog
    
    def new
      @command = CreateBlogCommand.new
    end
  
    def create
      @command = CreateBlogCommand.new(params[:command])
      if @command.valid?
        publish(@command)
        redirect_to root_path
      else
        render :action => 'new'
      end
    end
  end
end