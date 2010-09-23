class BlogPostCreatedHandler < Events::Handlers::BaseHandler
  def execute(event)
    html_content = Markdown.to_html(event.content)
    
    BlogPost.create!(
      :title => event.title,
      :raw_content => content,
      :html_content => html_content
    )
  end
end