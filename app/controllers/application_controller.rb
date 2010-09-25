class ApplicationController < ActionController::Base
  protect_from_forgery
  
  attr_reader :blog
  before_filter :find_blog
  
  helper_method :show_post_url
  
protected

  def publish(command)
    Rcqrs::Gateway.publish(command)
  end
  
  # Redirect to create a new blog if none exists
  def find_blog
    @blog ||= BlogReport.first
    redirect_to new_admin_create_blog_path and return false if @blog.nil?
  end
  
  def show_post_url(post, options={})
    options.merge!(:year => post.year, :month => post.month, :day => post.day, :slug => post.slug)
    post_slug_path(options)
  end
end