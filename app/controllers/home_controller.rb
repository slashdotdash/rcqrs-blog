class HomeController < ApplicationController
  def index
    @posts = PostReport.recent.limit(5)
    
    respond_to do |format|
      format.html
      format.atom
    end
  end
end