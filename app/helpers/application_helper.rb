module ApplicationHelper
  def make_post_url(post, options={})
    options.merge!(:year => post.year, :month => post.month, :day => post.day, :slug => post.slug)
    post_slug_path(options)
  end
end
