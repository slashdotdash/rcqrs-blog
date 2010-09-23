atom_feed(:tag_uri => "2010") do |feed|
  feed.title(@blog.name)
  feed.updated(@posts.first ? @posts.first.published_at : Time.now.utc)
  
  for post in @posts
    feed.entry(post, :url => root_path, :published => post.published_at, :updated => post.updated_at) do |entry|
      entry.title(post.title)
      entry.content(post.html_content, :type => 'html')
      
      # entry.author do |author|
      #   author.name(post.author_name)
      #   author.email(post.author_email_address)
      # end
    end
  end
end