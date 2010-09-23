class BlogPostPublishedHandler < Events::Handlers::BaseHandler
  def execute(event)
    html_content = GithubMarkdown.to_html(event.content)
    
    PostReport.create!(
      :guid => event.guid,
      :title => event.title,
      :raw_content => event.content,
      :html_content => html_content
    )
  end
end