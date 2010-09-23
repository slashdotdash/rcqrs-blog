class ApplicationController < ActionController::Base
  protect_from_forgery
  
  attr_reader :blog
  before_filter :find_blog
  
protected

  def publish(command)
    Rcqrs::Gateway.publish(command)
  end
  
  # Redirect to create a new blog if none exists
  def find_blog
    @blog ||= BlogReport.first
    redirect_to new_create_blog_path and return false if @blog.nil?
  end
end